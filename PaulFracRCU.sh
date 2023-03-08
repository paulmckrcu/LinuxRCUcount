#!/bin/bash
#
# Usage: PaulFracRCU.sh [ odir [ list of tags ] ]
#	Run in a Linux-kernel git repo.

odir=$1
if test $# -ne 0
then
	shift
else
	odir=/tmp
fi
if test $# -eq 0
then
	set `git tag -l | grep '^v[0-9]' | grep -ve "-" | sort -V`
fi

T="`mktemp -d ${TMPDIR-/tmp}/kvm.sh.XXXXXX`"
trap 'rm -rf $T' 0

last="$1"
shift

echo -n > "${odir}/all.dat"
echo -n > "${odir}/notpaul.dat"
echo -n > "${odir}/paulpct.dat"
xtics='set xtics ('
n=1
for i in "$@"
do
	# The strange "grep ." command prevents miscounting due to lack
	# of a line terminator on the last line.
	git log --no-merges --pretty=format:"%ae" "$last".."$1" -- include/*rcu* kernel/{rcu,rcu.h,rcupdate.c,rcutiny.c,rcutiny_plugin.h,rcutorture.c,rcutree.c,rcutree.h,rcutree_plugin.h,rcutree_trace.c,srcu.c} tools/testing/selftests/rcutorture/ kernel/torture.c include/linux/torture.h | grep . > $T/emails
	grep -E "paulmck@|paul.mckenney@linaro.org" $T/emails > $T/paulmck
	allcontrib=`wc -l $T/emails | awk '{ print $1 }'`
	paulmckcontrib=`wc -l $T/paulmck | awk '{ print $1 }'`
	notpaulmckcontrib=$((allcontrib-paulmckcontrib))
	if test "$allcontrib" -gt 0
	then
		paulmckcontribfrac=$((100*paulmckcontrib/allcontrib))
	else
		paulmckcontribfrac=0
	fi
	echo $n $allcontrib >> "${odir}/all.dat"
	echo $n $notpaulmckcontrib >> "${odir}/notpaul.dat"
	echo $n $paulmckcontrib >> "${odir}/paul.dat"
	echo $n $paulmckcontribfrac >> "${odir}/paulpct.dat"
	if test "$n" -ne 1
	then
		xtics="${xtics}, "
	fi
	xtics="${xtics}\"$1\" $n"
	last="$1"
	shift
	n=$((n+1))
done
xtics="${xtics}) rotate"
echo $xtics > ${odir}/xtics

echo -n > ${odir}/plots.sh
cat << ---EOF--- >> ${odir}/plots.sh
set nokey
set term jpeg size 1800,720
set size ratio 0.4
set yrange [0:]
---EOF---
echo set output '"'"${odir}/paulfrac.jpg"'"' >> ${odir}/plots.sh
cat ${odir}/xtics >> ${odir}/plots.sh
echo plot '"'"${odir}/notpaul.dat"'"' w l, '"'"${odir}/all.dat"'"' w l >> ${odir}/plots.sh
echo set output '"'"${odir}/paulpct.jpg"'"' >> ${odir}/plots.sh
echo plot '"'"${odir}/paulpct.dat"'"' w l >> ${odir}/plots.sh

gnuplot ${odir}/plots.sh
display ${odir}/paulfrac.jpg &
display ${odir}/paulpct.jpg &

# For two-year window, update dates in the following:
# git log --no-merges --pretty=format:"%ae" --since "March 5, 2021" --until "March 5, 2023" -- include/*rcu* kernel/{rcu,rcu.h,rcupdate.c,rcutiny.c,rcutiny_plugin.h,rcutorture.c,rcutree.c,rcutree.h,rcutree_plugin.h,rcutree_trace.c,srcu.c} tools/testing/selftests/rcutorture/ kernel/torture.c include/linux/torture.h | sort | uniq -c | sort -nr
