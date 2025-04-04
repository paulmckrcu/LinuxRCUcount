#!/bin/sh
#
# Issues cscope queries to gather data on both RCU and SRCU.
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
# Copyright (C) IBM Corporation, 2009-2019
# Copyright (C) Meta Platforms, Inc., 2019-
#
# Authors: Paul E. McKenney <paulmck@kernel.org>

destdir=${1-.}

(
	sh ${destdir}/SRCUcommon.sh
	sh ${destdir}/Non-SRCUcommon.sh
) | \
    grep -v '^include/linux/.*rcu.*\.h' | \
    grep -v '^kernel/rcuclassic\.c' | \
    grep -v '^kernel/rcupdate\.c' | \
    grep -v '^kernel/rcupdate\.h' | \
    grep -v '^kernel/rcupreempt\.c' | \
    grep -v '^kernel/rcupreempt_trace\.c' | \
    grep -v '^kernel/rcutiny\.c' | \
    grep -v '^kernel/rcutiny_plugin\.h' | \
    grep -v '^kernel/rcutree\.c' | \
    grep -v '^kernel/rcutree\.h' | \
    grep -v '^kernel/rcutree_plugin\.h' | \
    grep -v '^kernel/rcutree_trace\.c' | \
    grep -v '^kernel/torture\.c' | \
    grep -v '^kernel/srcu\.c' | \
    grep -v '^kernel/rcu/' | \
    grep -v "File does not have expected format" | \
    grep -v "^$" | \
    sort --key=1,1 --key=3n
