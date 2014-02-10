#!/bin/sh
#
# Issues cscope queries to gather data on RCU.
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

(

	# Markers for RCU read-side critical sections

	cscope -d -L -0 rcu_read_lock_bh
	cscope -d -L -0 rcu_read_unlock_bh

	# RCU lockdep assertion

	cscope -d -L -0 rcu_read_lock_held
	cscope -d -L -0 rcu_read_lock_bh_held

	# RCU pointer/list traversal

	cscope -d -L -0 rcu_dereference_bh
	cscope -d -L -0 rcu_dereference_bh_check
	cscope -d -L -0 rcu_dereference_bh_protected

	cscope -d -L -0 hlist_for_each_entry_rcu_bh
	cscope -d -L -0 hlist_for_each_entry_continue_rcu_bh

	# RCU grace period

	cscope -d -L -0 call_rcu_bh
	cscope -d -L -0 rcu_barrier_bh
	cscope -d -L -0 synchronize_rcu_bh
	cscope -d -L -0 synchronize_rcu_bh_expedited
) | grep -v '^include/linux/rcuclassic\.h' | \
    grep -v '^include/linux/rculist\.h' | \
    grep -v '^include/linux/rculist_bl\.h' | \
    grep -v '^include/linux/rculist_nulls\.h' | \
    grep -v '^include/linux/rcupdate\.h' | \
    grep -v '^include/linux/rcupreempt\.h' | \
    grep -v '^include/linux/rcupreempt_trace\.h' | \
    grep -v '^include/linux/rcutiny\.h' | \
    grep -v '^include/linux/rcutree\.h' | \
    grep -v '^include/linux/srcu\.h' | \
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
    grep -v '^kernel/srcu\.c' | \
    grep -v "File does not have expected format" | \
    grep -v "^$" | \
    sort --key=1,1 --key=3n
