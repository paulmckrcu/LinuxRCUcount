#!/bin/sh
#
# Produce a .dat file and plot of the number of RCU API members over time.
#
# Usage: RCUAPImembersplot.sh <awkfrag> <outputbase>
#
# Where "awkfrag" a file containing is the output from RCUAPImembers2awk.sh
# and "outputbase" is the basename of the .dat and .eps output files.
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
# Copyright (C) IBM Corporation, 2014
#
# Authors: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

if test -r "$1"
then
	:
else
	echo The awk-language code fragment file is unreadable: $1
	exit 1
fi

T=/tmp/RCUAPImembersplot.sh.$$
trap 'rm -rf $T' 0
mkdir $T

cat << ___EOF___ > $T/mkdat.awk
BEGIN {
___EOF___
cat $1 >> $T/mkdat.awk
cat << ___EOF___ >> $T/mkdat.awk
}
END {
	for (i = 0; i < version; i++) {
		v = versions[i];
		cf = commitfrac[i];
		n = 0;
		for (j = 0; j < numapis; j++) {
			ca = apis[j];
			if (API[ca ":" v] == 1)
				n++;
		}
		print cf, n;
	}
}
___EOF___
awk -f $T/mkdat.awk > $2.dat < /dev/null

fontsize=10
plotsize=0.5

gnuplot << ---EOF---
set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "/home/git/perfbook/fonts/uhvr8a.pfb"
set size square ${plotsize},${plotsize}
set output "$2.eps"
set xlabel "\nYear"
set xtics rotate
set ylabel "# RCU API Members"
set style data lines
# set logscale y
set nokey
# set label 1 "2.5" at 2003.5,285 r
# set label 2 "2.6" at 2007.3,1000 l
set yrange [0:]
plot "$2.dat"
set size 1,1
set term png
set output "$2.png"
replot
---EOF---
