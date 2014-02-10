#!/bin/sh
#
# Prints out a series of awk statements that populate the following arrays:
#
#	versions[]: Indexed by integers starting from zero, with each
#		element containing a git version tag, e.g., "v2.6.12".
#	apis[]: Indexed by integers starting from zero, with each
#		element containing an RCU API name.
#	API[]: Indexed by RCU API name followed by colon followed by
#		a git version tag, e.g., "rcu_read_lock:v2.6.12".
#		Each existing element indicates that the specified
#		RCU API existed in the specified version.
#
# Note that all current and prior RCU API members must be present in the
# "api" sh variable.  Which is obtained from RCUAPImembers.sh.
#
# These awk statements can then be included in an awk program that emits
# some view of the RCU API evolution over time, for example, a graph of
# the number of RCU API members or a table of what Linux-kernel version
# each RCU API member existed in.
#
# Usage sh RCUAPImembers2awk.sh <git archive path>
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

SD=`pwd`
if test -d "$1/.git"
then
	cd "$1"
else
	echo "No git directory at $1" 1>&2
	exit 1
fi

. $SD/RCUAPImembers.sh

T=/tmp/RCUAPImembers2awk.sh.$$
trap 'rm -rf $T' 0
mkdir $T

git remote update 1>&2
tags=`git tag -l | grep '^v2\.[0-9.]*$' | sort -k1.6n -k1.4n; \
      git tag -l | grep '^v3\.[0-9]*$' | sort -k1.4n`

echo "numapis = 0;"
for i in $api
do
	echo 'apis[numapis++] = "'$i'";'
done
echo "version = 0;"
for tag in $tags
do
	mkdir $T/$tag
	git reset --hard $tag 1>&2
	echo 'versions[version] = "'$tag'";'
	commitdate=`git log --pretty=format:"%cD" HEAD^..HEAD | \
		    sed -e 's/^.*, //' -e 's/...:.*$//' -e 's/ /-/g'`
	commitfrac=`sh $SD/date2frac.sh $commitdate`
	echo 'commitfrac[version] = "'$commitfrac'";'
	echo 'version++;'
	rm -rf cscope.*
	find . \( -name SCCS -prune \) -o \( -name .git -prune \) -o \( -name '*.[h]' -print \) | grep -v -e '-impl\.h$' | cscope -bkq -i -
	for i in $api
	do
		cscope -d -L -0 $i > $T/$tag/$i
		if test -s $T/$tag/$i
		then
			echo 'API["'$i'" ":" "'$tag'"] = 1;'
		fi
	done
done
rm -rf cscope.*
