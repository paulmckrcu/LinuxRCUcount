#! /bin/sh
#
# Create plots from the RCU and locking data generated.
#
# Execute this script in the directory containing the data
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

fontsize=10
plotsize=0.5
medplotsize=0.75
bigplotsize=1.0

gnuplot << ---EOF---
set term postscript portrait ${fontsize}
set size square ${plotsize},${plotsize}
set output "linux-RCU.eps"
set xlabel "\nYear"
set xtics rotate
set ylabel "# RCU API Uses"
set style data lines
# set logscale y
set nokey
# set label 1 "2.5" at 2003.5,285 r
# set label 2 "2.6" at 2007.3,1000 l
set yrange [0:]
plot "rcu.dat"
set size 1,1
set term png medium
set output "linux-RCU.png"
replot
---EOF---

gnuplot << ---EOF---
set term postscript portrait ${fontsize}
set size square ${plotsize},${plotsize}
set output "linux-RCUlock.eps"
set xlabel "\nYear"
set xtics rotate
set ylabel "# RCU/locking API Uses"
set style data lines
set yrange [0:]
set nokey
set label 1 "locking" at 2022,130000 r
set label 2 "RCU" at 2022,27000 r
# set label 3 "Locking" at 2003.5,17000 l
plot "rcu.dat", "lock.dat"
set size 1,1
set term png medium
set output "linux-RCUlock.png"
replot
---EOF---

gnuplot << ---EOF---
set term postscript portrait ${fontsize}
set size square ${plotsize},${plotsize}
set output "linux-RCUlocklog.eps"
set xlabel "\nYear"
set xtics rotate
set ylabel "# RCU/locking API Uses"
set style data lines
set yrange [1:]
set logscale y
set nokey
set label 1 "RCU" at 2022,7500 r
set label 2 "locking" at 2022,70000 r
plot "rcu.dat", "lock.dat"
set size 1,1
set term png medium
set output "linux-RCUlocklog.png"
replot
---EOF---

join lock.dat rcu.dat | awk '{ print $1, 100 * $3 / $2 }' > rculockpct.dat
gnuplot << ---EOF---
set term postscript portrait ${fontsize}
set size square ${plotsize},${plotsize}
set output "linux-RCUlockpct.eps"
set xlabel "\nYear"
set xtics rotate
set ylabel "RCU Uses as % of Locking"
set style data lines
# set yrange [1:]
# set logscale y
set nokey
# set label 1 "2.5 RCU" at 2003.2,15 l
# set label 2 "RCU" at 2006.3,550 l
# set label 3 "Locking" at 2005,25000 l
plot "rculockpct.dat"
set size 1,1
set term png medium
set output "linux-RCUlockpct.png"
replot
---EOF---

gnuplot << ---EOF---
set term postscript portrait ${fontsize}
set size square ${plotsize},${plotsize}
set output "linux-RCUrwlock.eps"
set xlabel "\nYear"
set xtics rotate
set ylabel "RCU Uses vs. Reader-Writer Locking"
set style data lines
# set yrange [1:]
# set logscale y
set nokey
set label 1 "Reader-Writer" at 2025,5400 r
set label 2 "Locking" at 2025,2900 r
set label 3 "RCU" at 2022,20000 r
# set label 3 "Locking" at 2005,25000 l
plot "rcu.dat", "rwlock.dat"
set size 1,1
set term png medium
set output "linux-RCUrwlock.png"
replot
---EOF---
