#!/bin/sh
#
# Downloads the specified Linux-kernel source-tree tarball, unpacks it,
# builds a cscope database against it, and invokes the LockAnalysis.sh,
# RWlockAnalysis.sh, and RCUanalysis.sh scripts to collect the respective
# data.  It then appends this data to the .dat files and the rculock.tab
# file, and then regenerates the plots and the rculocktab.html file.
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
# Copyright (C) IBM Corporation, 2009
#
# Authors: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

destdir=`pwd`
T=/tmp/LinuxRCUcount.sh.$$
trap 'rm -rf ${T}' 0
mkdir $T
cd $T
mkdir F

version=$1
outdir=${2-results}
majorversion=`echo ${version} | sed -e 's/\(...\).*$/\1/'`
case "$majorversion" in
	2.5) downloadversion=2.5;;
	2.6) downloadversion=2.6;;
	3.*) downloadversion=3.x;;
esac
directory=linux-$version
archive=${directory}.tar.xz
sign=${directory}.tar.sign
signxz=${directory}.tar.xz.sign

# Signature failure likely means that the attempted download failed.
# Some versions of Linux only sign the .tar, others sign only the .tar.xz.
# So try downloading and verifying both...
while :
do
	wget https://www.kernel.org/pub/linux/kernel/v${downloadversion}/${archive}
	wget https://www.kernel.org/pub/linux/kernel/v${downloadversion}/${signxz}
	wget https://www.kernel.org/pub/linux/kernel/v${downloadversion}/${sign}
	if test -f ${signxz} && gpg --verify ${signxz}
	then
		break;
	elif test -f ${sign} && xzcat ${archive} | gpg --verify $sign -
	then
		break;
	else
		echo Signature verification failed: ${sign}, ${signxz}
		ls -l ${archive} ${sign} ${signxz}
		rm ${archive} ${sign} ${signxz}
	fi
done

tar -xJf ${archive}
rm -f ${archive}
cd ${directory}
find . \( -name SCCS -prune \) -o \( -name '*.[hcCS]' -print \) | \
	cscope -bkq -i -
sh ${destdir}/RCUanalysis.sh > $T/F/${directory}.rcua
wc -l < $T/F/${directory}.rcua > $T/F/${directory}.wc
sh ${destdir}/summarizecscope.sh < $T/F/${directory}.rcua > $T/F/${directory}.sum
sh ${destdir}/LockAnalysis.sh | wc -l > $T/F/${directory}.lockwc
sh ${destdir}/RWlockAnalysis.sh | wc -l > $T/F/${directory}.rwlockwc
cd ${destdir}
mkdir $outdir || :
cp $T/F/* $outdir
wget http://kernel.org/pub/linux/kernel/v${downloadversion}/ -O - 2> /dev/null | \
	grep '"'"${archive}"'"' | \
	awk '{print $3}' > $outdir/${directory}.date
touch $outdir/rcu.dat $outdir/lock.dat $outdir/rwlock.dat $outdir/rculock.tab
date="`cat $outdir/${directory}.date`"
datefrac="`sh ${destdir}/date2frac.sh $date`"
rcucnt="`cat $outdir/${directory}.wc`"
lockcnt="`cat $outdir/${directory}.lockwc`"
rwlockcnt="`cat $outdir/${directory}.rwlockwc`"
echo $datefrac $rcucnt >> $outdir/rcu.dat
echo $datefrac $lockcnt >> $outdir/lock.dat
echo $datefrac $rwlockcnt >> $outdir/rwlock.dat
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
