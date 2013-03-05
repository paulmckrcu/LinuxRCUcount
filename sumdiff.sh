#!/bin/sh
# 
# Usage: sh sumdiff x.sum y.sum
#
# Inputs produced by AnalyzeRCU.sh.  Differential-profile output to stdout.
# Does -not- detect changes in pathname, only cost.
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
# Copyright (C) IBM Corporation, 2009
#
# Authors: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

TMPDIR=/tmp/sumdiff$$
trap 'rm -rf $TMPDIR' 0
mkdir $TMPDIR

if [ -f $1 -a -f $2 ]
then
	sort -k2,2 $1 > $TMPDIR/sum1.sort
	sort -k2,2 $2 > $TMPDIR/sum2.sort
	join -1 2 -2 2 $TMPDIR/sum1.sort $TMPDIR/sum2.sort > $TMPDIR/match
	join -1 2 -2 2 -a 1 $TMPDIR/sum1.sort $TMPDIR/sum2.sort |
		awk '{ if (NF == 2) print $0 }' > $TMPDIR/1only
	join -1 2 -2 2 -a 2 $TMPDIR/sum1.sort $TMPDIR/sum2.sort |
		awk '{ if (NF == 2) print $0 }' > $TMPDIR/2only
	awk '{ if ($2 != $3) print $0 }' < $TMPDIR/match > $TMPDIR/matchdiff
elif [ -f $1 ]
then
	sort -k2,2 $1 > $TMPDIR/sum1.sort
	touch $TMPDIR/sum2.sort
	touch $TMPDIR/matchdiff
	awk '{ print $1, $2, $1, 0 }' < $1 | sort -k2,2 > $TMPDIR/1only
	touch $TMPDIR/2only
elif [ -f $2 ]
then
	touch $TMPDIR/sum1.sort
	sort -k2,2 $2 > $TMPDIR/sum2.sort
	touch $TMPDIR/matchdiff
	touch $TMPDIR/1only
	awk '{ print $1, $2, $1, 0 }' < $2 | sort -k2,2 > $TMPDIR/2only
else
	echo "Error: both files $1, $2 non-existent"
	exit
fi

echo " --- CHANGED directories:"
echo
awk '{ print $3-$2, $0 }' < $TMPDIR/matchdiff |
	sort -k1,1nr
echo
echo
echo " --- ADDED directories:"
echo
join -1 2 -2 2 $TMPDIR/2only $TMPDIR/sum2.sort |
	sort -k2,2nr |
	awk '{print $2, $0}'
echo
echo
echo " --- DELETED directories:"
echo
join -1 2 -2 2 $TMPDIR/1only $TMPDIR/sum1.sort |
	sort -k2,2nr |
	awk '{print -$2, $0}'
echo
