#!/bin/sh
#
# Given a .sum per-directory summary as input, aggregate sums to the top-level
# directory.  Run in a Linux source tree to also compare against LoC.
# Can specify directory level, defaults to "1" for top-level directory.
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
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#
# Copyright (C) IBM Corporation, 2013
#
# Authors: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

T=/tmp/RCUbySubsystem.sh.$$
trap 'rm -rf $T' 0
mkdir $T

nlevels=${1-1}

sed -e 's;^\(\([^/]\+/\)\{1,'$nlevels'\}\).*$;\1;' |
	awk '{ perdir[$2] += $1; } END { for (i in perdir) print i, perdir[i]; }' | sort > $T/u
awk '{ print $1}' < $T/u > $T/d
for i in `cat $T/d`
do
	find $i -type f -name '*.[hc]' -exec wc -l {} \; |
		awk -v i=$i '{ sum += $1 } END { print i, sum }'
done | sort > $T/loc
join -j 1 $T/u $T/loc | sed -e 's,/ , ,' > $T/uloc
awk '{ print $1, $2, $3, $2 * 1000 / $3 }' < $T/uloc | sort -k4nr > $T/ulocf
awk '{ s2 += $2; s3 += $3; print $0 } END { print "Total", s2, s3, s2 * 1000 / s3 }' < $T/ulocf > $T/ulocft
awk '{ printf "%s & %d & %'"'"'d & %5.2f \\\\\n", $1, $2, $3, $4 }' < $T/ulocft
