#!/bin/sh
#
# Convert a Linux-kernel version from v2.4.x or earlier to the release
# date.  Later versions' release dates are pulled from the relevant git
# archive.
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
# Copyright (C) Meta Platforms, Inc., 2025
#
# Authors: Paul E. McKenney <paulmck@kernel.org>

T="`mktemp -d ${TMPDIR-/tmp}/version2date.sh.XXXXXX`"
trap 'rm -rf $T' 0

echo > $T/v2d.awk "BEGIN {"
cat version2date.awk >> $T/v2d.awk
cat >> $T/v2d.awk << "---EOF---"
}

{
	d = v2d[$1];
	if (d != "")
		print d;
	else
		print "01-Jan-1994";
}
---EOF---
cat $T/v2d.awk > /tmp/argh
echo $1 | awk -f $T/v2d.awk
