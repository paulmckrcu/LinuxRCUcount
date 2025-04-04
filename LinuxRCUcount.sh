#!/bin/sh
#
# Clones the specified Linux-kernel source-tree version, builds a cscope
# database against it, and invokes the LockAnalysis.sh, RWlockAnalysis.sh,
# and RCUanalysis.sh scripts to collect the respective data.  It then
# appends this data to the .dat files, the rculock.tab file, and the
# rculocktab.html file.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, you can access it online at
# http://www.gnu.org/licenses/gpl-2.0.html.
#
# Copyright (C) IBM Corporation, 2009-2019
# Copyright (C) Meta Platforms, Inc., 2019-
#
# Authors: Paul E. McKenney <paulmck@kernel.org>

destdir=`pwd`
T=/tmp/LinuxRCUcount.sh.$$
trap 'rm -rf ${T}' 0
mkdir $T
cd $T
mkdir F
current=/home/git/linux/.git
historical=/home/git/tglx-history/.git

version=$1
outdir=${2-results}
case "$version" in
	2.5*)
		toclone=${historical}
		;;
	2.6.11|2.6.10|2.6.[0-9])
		toclone=${historical}
		;;
	*)
		toclone=${current}
		;;
esac
tag="v${version}"

# Clone selected archive.
git clone --reference ${toclone} ${toclone} linux
directory=linux-${version}

# Attempt to check out the tag, update and retry if ${current}.
cd linux
if ! git checkout ${tag}
then
	( cd ${toclone} ; git remote update )
	git remote add linus git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
	git remote update
	echo Current directory now `pwd` vs. ${directory} # @@@
	if ! git checkout ${tag}
	then
		echo Error: tag ${tag} not found in ${current}.
		exit 1
	fi
fi
date="`git log HEAD^..HEAD --date=format:'%d-%b-%Y' --format='%ad'`"

# Build cscope database
DIRS="`ls -d */ | egrep -v '^(certs|Documentation|firmware|samples|scripts|tools|usr)/$'`"
find $DIRS \( -name SCCS -prune \) -o \( -name .git -prune \) -o \( -name '*.[hcCS]' -print \) |
	cscope -bkq -i -

# Analyze cscope data and squirrel away the results.
sh ${destdir}/RCUanalysis.sh ${destdir} > $T/F/${directory}.rcua
wc -l < $T/F/${directory}.rcua > $T/F/${directory}.wc
sh ${destdir}/summarizecscope.sh < $T/F/${directory}.rcua > $T/F/${directory}.sum
sh ${destdir}/SRCUanalysis.sh ${destdir} | wc -l > $T/F/${directory}.srcuwc
sh ${destdir}/Non-SRCUanalysis.sh ${destdir} | wc -l > $T/F/${directory}.nonsrcuwc
sh ${destdir}/LockAnalysis.sh ${destdir} | wc -l > $T/F/${directory}.lockwc
sh ${destdir}/RWlockAnalysis.sh ${destdir} | wc -l > $T/F/${directory}.rwlockwc
sh ${destdir}/RWspinlockAnalysis.sh ${destdir} | wc -l > $T/F/${directory}.rwspinlockwc
sh ${destdir}/RWsleeplockAnalysis.sh ${destdir} | wc -l > $T/F/${directory}.rwsleeplockwc
cd ${destdir}
mkdir $outdir || :
cp $T/F/* $outdir
(
	cd ${outdir}
	touch rcu.dat srcu.dat nonsrcu.dat lock.dat rwlock.dat rwspinlock.dat rwsleeplock.dat
)
datefrac="`sh ${destdir}/date2frac.sh $date`"

rcucnt="`cat $outdir/${directory}.wc`"
echo $datefrac $rcucnt >> $outdir/rcu.dat
srcucnt="`cat $outdir/${directory}.srcuwc`"
echo $datefrac $srcucnt >> $outdir/srcu.dat
nonsrcucnt="`cat $outdir/${directory}.nonsrcuwc`"
echo $datefrac $nonsrcucnt >> $outdir/nonsrcu.dat
lockcnt="`cat $outdir/${directory}.lockwc`"
echo $datefrac $lockcnt >> $outdir/lock.dat
rwlockcnt="`cat $outdir/${directory}.rwlockwc`"
echo $datefrac $rwlockcnt >> $outdir/rwlock.dat
rwspinlockcnt="`cat $outdir/${directory}.rwspinlockwc`"
echo $datefrac $rwspinlockcnt >> $outdir/rwspinlock.dat
rwsleeplockcnt="`cat $outdir/${directory}.rwsleeplockwc`"
echo $datefrac $rwsleeplockcnt >> $outdir/rwsleeplock.dat
echo "<TR><TD>$date</TD>" >> $outdir/rculock.tab
echo "    <TD>$rcucnt</TD><TD>$lockcnt</TD>" >> $outdir/rculock.tab
echo "    <TD><A HREF=\"${directory}.sum\">${directory}.sum</A></TD>" >> $outdir/rculock.tab
echo "    <TD><A HREF=\"${directory}.rcua\">${directory}.rcua</A></TD></TR>" >> $outdir/rculock.tab
cat << ---EOF--- > $outdir/rculocktab.html
<HEAD>
<TITLE>Read-Copy Update (RCU) Usage in Linux Kernel</TITLE>
</HEAD>
<BODY>
<H1>Read-Copy Update (RCU) Usage in Linux Kernel</H1>
<TABLE BORDER="1"><TBODY>
<TR><TH>Date</TH><TH># RCU Invocations</TH><TH># Lock Invocations</TH>
<TH>RCU Summary</TH><TH>RCU cscope</TH></TR>
---EOF---
cat $outdir/rculock.tab >> $outdir/rculocktab.html
echo "</TBODY></TABLE></BODY>" >> $outdir/rculocktab.html
rm -rf $T
