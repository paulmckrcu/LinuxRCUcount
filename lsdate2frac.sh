#!/bin/sh
#
# Converts "ls -l" format dates to approximate decimal year, in a manner
# similar to date2frac.sh.
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

echo $1 |
	sed -e 's/-\([0-9][0-9]\)-\([0-9][0-9]\)/+(\1-1)\/12+(\2-1)\/12\/31/' |
	bc -l | \
	awk '{printf "%.3f\n", $1}'
