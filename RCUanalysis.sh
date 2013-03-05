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
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#
# Copyright (C) IBM Corporation, 2009
#
# Authors: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

(

	# Markers

	cscope -d -L -0 __rcu

	# Initialization and cleanup

	cscope -d -L -0 init_srcu_struct
	cscope -d -L -0 cleanup_srcu_struct
	cscope -d -L -0 RCU_HEAD_INIT # DEAD
	cscope -d -L -0 RCU_INIT_POINTER
	cscope -d -L -0 INIT_RCU_POINTER
	cscope -d -L -0 RCU_POINTER_INITIALIZER
	cscope -d -L -0 init_rcu_head_on_stack
	cscope -d -L -0 destroy_rcu_head_on_stack
	cscope -d -L -0 SLAB_DESTROY_BY_RCU

	# Markers for RCU read-side critical sections

	cscope -d -L -0 rcu_read_lock
	cscope -d -L -0 rcu_read_unlock
	cscope -d -L -0 rcu_read_lock_bh
	cscope -d -L -0 rcu_read_unlock_bh
	cscope -d -L -0 rcu_read_lock_sched
	cscope -d -L -0 rcu_read_lock_sched_notrace
	cscope -d -L -0 rcu_read_unlock_sched
	cscope -d -L -0 rcu_read_unlock_sched_notrace
	cscope -d -L -0 srcu_read_lock
	cscope -d -L -0 srcu_read_lock_raw
	cscope -d -L -0 srcu_read_unlock
	cscope -d -L -0 srcu_read_unlock_raw
	cscope -d -L -0 RCU_NONIDLE

	# RCU lockdep assertion

	cscope -d -L -0 rcu_lockdep_assert
	cscope -d -L -0 rcu_read_lock_held
	cscope -d -L -0 rcu_read_lock_bh_held
	cscope -d -L -0 rcu_read_lock_sched_held
	cscope -d -L -0 rcu_sleep_check
	cscope -d -L -0 srcu_read_lock_held

	# RCU pointer/list traversal

	cscope -d -L -0 rcu_access_pointer
	cscope -d -L -0 rcu_access_index
	cscope -d -L -0 rcu_dereference
	cscope -d -L -0 rcu_dereference_bh
	cscope -d -L -0 rcu_dereference_bh_check
	cscope -d -L -0 rcu_dereference_bh_protected
	cscope -d -L -0 rcu_dereference_check
	cscope -d -L -0 rcu_dereference_index_check
	cscope -d -L -0 rcu_dereference_protected
	cscope -d -L -0 rcu_dereference_raw
	cscope -d -L -0 rcu_dereference_sched
	cscope -d -L -0 rcu_dereference_sched_check
	cscope -d -L -0 rcu_dereference_sched_protected
	cscope -d -L -0 srcu_dereference
	cscope -d -L -0 srcu_dereference_check

	cscope -d -L -0 list_entry_rcu
	cscope -d -L -0 list_next_rcu
	cscope -d -L -0 list_first_entry_rcu
	cscope -d -L -0 list_for_each_rcu  # Dead!!!
	cscope -d -L -0 list_for_each_safe_rcu  # Dead!!!
	cscope -d -L -0 list_for_each_entry_rcu
	cscope -d -L -0 list_for_each_continue_rcu # ->list_for_each_entry_continue_rcu
	cscope -d -L -0 list_for_each_entry_continue_rcu
	cscope -d -L -0 hlist_first_rcu
	cscope -d -L -0 hlist_next_rcu
	cscope -d -L -0 hlist_pprev_rcu
	cscope -d -L -0 hlist_for_each_rcu  # Dead!!!
	cscope -d -L -0 hlist_for_each_entry_rcu
	cscope -d -L -0 hlist_for_each_entry_rcu_bh
	cscope -d -L -0 hlist_for_each_entry_continue_rcu
	cscope -d -L -0 hlist_for_each_entry_continue_rcu_bh

	cscope -d -L -0 hlist_nulls_first_rcu
	cscope -d -L -0 hlist_nulls_for_each_entry_rcu

	cscope -d -L -0 hlist_bl_first_rcu
	cscope -d -L -0 hlist_bl_for_each_entry_rcu

	# RCU pointer update

	cscope -d -L -0 rcu_assign_pointer
	cscope -d -L -0 list_add_rcu
	cscope -d -L -0 list_add_tail_rcu
	cscope -d -L -0 list_del_rcu
	cscope -d -L -0 list_replace_rcu
	cscope -d -L -0 hlist_del_rcu
	cscope -d -L -0 hlist_del_init_rcu
	cscope -d -L -0 hlist_replace_rcu
	cscope -d -L -0 hlist_add_head_rcu
	cscope -d -L -0 hlist_add_before_rcu
	cscope -d -L -0 hlist_add_after_rcu
	cscope -d -L -0 list_splice_init_rcu

	cscope -d -L -0 hlist_nulls_del_init_rcu
	cscope -d -L -0 hlist_nulls_del_rcu
	cscope -d -L -0 hlist_nulls_add_head_rcu

	cscope -d -L -0 hlist_bl_set_first_rcu
	cscope -d -L -0 hlist_bl_del_init_rcu
	cscope -d -L -0 hlist_bl_del_rcu
	cscope -d -L -0 hlist_bl_add_head_rcu

	# RCU grace period

	cscope -d -L -0 kfree_rcu
	cscope -d -L -0 call_rcu
	cscope -d -L -0 call_rcu_bh
	cscope -d -L -0 call_rcu_sched
	cscope -d -L -0 call_srcu
	cscope -d -L -0 rcu_barrier
	cscope -d -L -0 rcu_barrier_bh
	cscope -d -L -0 rcu_barrier_sched
	cscope -d -L -0 srcu_barrier
	cscope -d -L -0 synchronize_kernel # Dead!!!
	cscope -d -L -0 synchronize_net
	cscope -d -L -0 synchronize_rcu
	cscope -d -L -0 synchronize_rcu_expedited
	cscope -d -L -0 synchronize_rcu_bh
	cscope -d -L -0 synchronize_rcu_bh_expedited
	cscope -d -L -0 synchronize_sched
	cscope -d -L -0 synchronize_sched_expedited
	cscope -d -L -0 synchronize_srcu
	cscope -d -L -0 synchronize_srcu_expedited
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
