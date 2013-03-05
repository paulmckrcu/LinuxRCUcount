#!/bin/sh
#
# Convert dates to approximate decimal year, so that "18-Dec-2003" becomes
# "2003.965":
#
#	> sh date2frac.sh 18-Dec-2003
#	2003.965
#
# This script uses the rough-and-ready approximation of each month being
# 31 days long, which is good enough for the x-axis of a plot.  There are
# integer-arithmetic formulas that produce exact results for more exacting
# applications.
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

echo $1 | sed -e 's/-Jan-/\/(31*12)+/' \
	      -e 's/-Feb-/\/(31*12)+1\/12+/' \
	      -e 's/-Mar-/\/(31*12)+2\/12+/' \
	      -e 's/-Apr-/\/(31*12)+3\/12+/' \
	      -e 's/-May-/\/(31*12)+4\/12+/' \
	      -e 's/-Jun-/\/(31*12)+5\/12+/' \
	      -e 's/-Jul-/\/(31*12)+6\/12+/' \
	      -e 's/-Aug-/\/(31*12)+7\/12+/' \
	      -e 's/-Sep-/\/(31*12)+8\/12+/' \
	      -e 's/-Oct-/\/(31*12)+9\/12+/' \
	      -e 's/-Nov-/\/(31*12)+10\/12+/' \
	      -e 's/-Dec-/\/(31*12)+11\/12+/' | \
	bc -l | \
	awk '{printf "%.3f\n", $1}'
