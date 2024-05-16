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

	# Markers

	cscope -d -L -0 __rcu

	# Initialization and cleanup

	cscope -d -L -0 init_srcu_struct
	cscope -d -L -0 cleanup_srcu_struct
	cscope -d -L -0 RCU_HEAD_INIT # DEAD
	cscope -d -L -0 rcu_head_init
	cscope -d -L -0 RCU_INIT_POINTER
	cscope -d -L -0 RCU_INITIALIZER
	cscope -d -L -0 INIT_RCU_POINTER # obsolete
	cscope -d -L -0 RCU_POINTER_INITIALIZER
	cscope -d -L -0 init_rcu_head
	cscope -d -L -0 destroy_rcu_head
	cscope -d -L -0 init_rcu_head_on_stack
	cscope -d -L -0 destroy_rcu_head_on_stack
	cscope -d -L -0 SLAB_DESTROY_BY_RCU # Dead!!!
	cscope -d -L -0 SLAB_TYPESAFE_BY_RCU
	cscope -d -L -0 DEFINE_SRCU
	cscope -d -L -0 DEFINE_STATIC_SRCU

	# Markers for RCU read-side critical sections

	cscope -d -L -0 rcu_read_lock
	cscope -d -L -0 rcu_read_unlock
	cscope -d -L -0 rcu_read_lock_bh
	cscope -d -L -0 rcu_read_unlock_bh
	cscope -d -L -0 rcu_read_lock_sched
	cscope -d -L -0 rcu_read_lock_sched_notrace
	cscope -d -L -0 rcu_read_unlock_sched
	cscope -d -L -0 rcu_read_unlock_sched_notrace
	cscope -d -L -0 rcu_read_lock_trace
	cscope -d -L -0 rcu_read_unlock_trace
	cscope -d -L -6 "guard\(rcu\)\(\)"
	cscope -d -L -0 srcu_read_lock
	cscope -d -L -0 srcu_read_lock_nmisafe
	cscope -d -L -0 srcu_read_lock_raw # Dead!!!
	cscope -d -L -0 srcu_read_lock_notrace
	cscope -d -L -0 srcu_read_unlock
	cscope -d -L -0 srcu_read_unlock_nmisafe
	cscope -d -L -0 srcu_read_unlock_raw # Dead!!!
	cscope -d -L -0 srcu_read_unlock_notrace
	cscope -d -L -0 srcu_down_read
	cscope -d -L -0 srcu_up_read
	cscope -d -L -0 smp_mb__after_srcu_read_unlock
	cscope -d -L -6 "guard\(srcu\)\("
	cscope -d -L -6 "scoped_guard\(srcu,"
	cscope -d -L -0 RCU_NONIDLE # Dead!!!

	# RCU lockdep assertion

	cscope -d -L -0 rcu_lockdep_assert # Dead!!!
	cscope -d -L -0 RCU_LOCKDEP_WARN
	cscope -d -L -0 rcu_read_lock_held
	cscope -d -L -0 rcu_read_lock_bh_held
	cscope -d -L -0 rcu_read_lock_sched_held
	cscope -d -L -0 rcu_read_lock_trace_held
	cscope -d -L -0 rcu_read_lock_any_held
	cscope -d -L -0 rcu_sleep_check
	cscope -d -L -0 srcu_read_lock_held

	# RCU pointer/list traversal

	cscope -d -L -0 rcu_access_pointer
	cscope -d -L -0 rcu_access_index # Dead!!!
	cscope -d -L -0 rcu_dereference
	cscope -d -L -0 rcu_dereference_bh
	cscope -d -L -0 rcu_dereference_bh_check
	cscope -d -L -0 rcu_dereference_bh_protected # Dead!!!
	cscope -d -L -0 rcu_dereference_check
	cscope -d -L -0 rcu_dereference_index_check # Dead!!!
	cscope -d -L -0 rcu_dereference_protected
	cscope -d -L -0 rcu_dereference_raw
	cscope -d -L -0 rcu_dereference_raw_check
	cscope -d -L -0 rcu_dereference_raw_notrace # Dead!!!
	cscope -d -L -0 rcu_dereference_sched
	cscope -d -L -0 rcu_dereference_sched_check
	cscope -d -L -0 rcu_dereference_sched_protected # Dead!!!
	cscope -d -L -0 srcu_dereference
	cscope -d -L -0 srcu_dereference_check
	cscope -d -L -0 srcu_dereference_notrace
	cscope -d -L -0 rcu_pointer_handoff

	cscope -d -L -0 list_entry_lockless
	cscope -d -L -0 list_entry_rcu
	cscope -d -L -0 list_next_rcu
	cscope -d -L -0 list_first_entry_rcu # Dead!!!
	cscope -d -L -0 list_first_or_null_rcu
	cscope -d -L -0 list_next_or_null_rcu
	cscope -d -L -0 list_tail_rcu
	cscope -d -L -0 list_for_each_rcu  # Dead!!!
	cscope -d -L -0 list_for_each_safe_rcu  # Dead!!!
	cscope -d -L -0 list_for_each_entry_rcu
	cscope -d -L -0 list_for_each_continue_rcu # ->list_for_each_entry_continue_rcu
	cscope -d -L -0 list_for_each_entry_continue_rcu
	cscope -d -L -0 list_for_each_entry_from_rcu
	cscope -d -L -0 list_for_each_entry_lockless
	cscope -d -L -0 list_for_each_entry_srcu
	cscope -d -L -0 hlist_first_rcu
	cscope -d -L -0 hlist_next_rcu
	cscope -d -L -0 hlist_pprev_rcu
	cscope -d -L -0 hlist_for_each_rcu  # Dead!!!
	cscope -d -L -0 hlist_for_each_entry_rcu
	cscope -d -L -0 hlist_for_each_entry_rcu_notrace
	cscope -d -L -0 hlist_for_each_entry_rcu_bh
	cscope -d -L -0 hlist_for_each_entry_continue_rcu
	cscope -d -L -0 hlist_for_each_entry_continue_rcu_bh
	cscope -d -L -0 hlist_for_each_entry_from_rcu
	cscope -d -L -0 hlist_for_each_entry_srcu

	cscope -d -L -0 hlist_nulls_first_rcu
	cscope -d -L -0 hlist_nulls_next_rcu
	cscope -d -L -0 hlist_nulls_for_each_entry_rcu
	cscope -d -L -0 hlist_nulls_for_each_entry_safe

	cscope -d -L -0 hlist_bl_first_rcu
	cscope -d -L -0 hlist_bl_for_each_entry_rcu

	# RCU pointer update

	cscope -d -L -0 rcu_assign_pointer
	cscope -d -L -0 rcu_replace_pointer
	cscope -d -L -0 unrcu_pointer
	cscope -d -L -0 list_add_rcu
	cscope -d -L -0 list_add_tail_rcu
	cscope -d -L -0 list_del_rcu
	cscope -d -L -0 list_replace_rcu
	cscope -d -L -0 list_splice_init_rcu
	cscope -d -L -0 list_splice_tail_init_rcu

	cscope -d -L -0 INIT_LIST_HEAD_RCU
	cscope -d -L -0 hlist_del_rcu
	cscope -d -L -0 hlist_del_init_rcu
	cscope -d -L -0 hlist_replace_rcu
	cscope -d -L -0 hlist_add_head_rcu
	cscope -d -L -0 hlist_add_before_rcu
	cscope -d -L -0 hlist_add_behind_rcu
	cscope -d -L -0 hlist_add_tail_rcu
	cscope -d -L -0 hlist_add_after_rcu # Dead!!!
	cscope -d -L -0 hlist_nulls_add_fake
	cscope -d -L -0 hlists_swap_heads_rcu

	cscope -d -L -0 hlist_nulls_del_init_rcu
	cscope -d -L -0 hlist_nulls_del_rcu
	cscope -d -L -0 hlist_nulls_add_head_rcu
	cscope -d -L -0 hlist_nulls_add_tail_rcu

	cscope -d -L -0 hlist_bl_set_first_rcu
	cscope -d -L -0 hlist_bl_del_init_rcu # Dead!!!
	cscope -d -L -0 hlist_bl_del_rcu
	cscope -d -L -0 hlist_bl_add_head_rcu

	# RCU grace period

	cscope -d -L -0 kfree_rcu
	cscope -d -L -0 kvfree_rcu
	cscope -d -L -0 kfree_rcu_mightsleep
	cscope -d -L -0 kvfree_rcu_mightsleep
	cscope -d -L -0 call_rcu
	cscope -d -L -0 call_rcu_hurry
	cscope -d -L -0 call_rcu_bh # Dead!!!
	cscope -d -L -0 call_rcu_sched # Dead!!!
	cscope -d -L -0 call_rcu_tasks
	cscope -d -L -0 call_rcu_tasks_rude
	cscope -d -L -0 call_rcu_tasks_trace
	cscope -d -L -0 call_srcu
	cscope -d -L -0 rcu_barrier
	cscope -d -L -0 rcu_barrier_bh # Dead!!!
	cscope -d -L -0 rcu_barrier_sched # Dead!!!
	cscope -d -L -0 rcu_barrier_tasks
	cscope -d -L -0 rcu_barrier_tasks_rude
	cscope -d -L -0 rcu_barrier_tasks_trace
	cscope -d -L -0 srcu_barrier
	cscope -d -L -0 synchronize_kernel # Dead!!!
	cscope -d -L -0 synchronize_net
	cscope -d -L -0 synchronize_rcu
	cscope -d -L -0 synchronize_rcu_expedited
	cscope -d -L -0 synchronize_rcu_bh # Dead!!!
	cscope -d -L -0 synchronize_rcu_bh_expedited # Dead!!!
	cscope -d -L -0 synchronize_rcu_tasks
	cscope -d -L -0 synchronize_rcu_tasks_rude
	cscope -d -L -0 synchronize_rcu_tasks_trace
	cscope -d -L -0 rcu_trace_implies_rcu_gp
	cscope -d -L -0 synchronize_sched # Dead!!!
	cscope -d -L -0 synchronize_sched_expedited # Dead!!!
	cscope -d -L -0 synchronize_srcu
	cscope -d -L -0 synchronize_srcu_expedited
	cscope -d -L -0 synchronize_rcu_mult

	# RCU polled grace period

	cscope -d -L -0 cond_synchronize_rcu
	cscope -d -L -0 cond_synchronize_rcu_full
	cscope -d -L -0 cond_synchronize_rcu_expedited
	cscope -d -L -0 cond_synchronize_rcu_expedited_full
	cscope -d -L -0 get_completed_synchronize_rcu
	cscope -d -L -0 get_completed_synchronize_rcu_full
	cscope -d -L -0 get_state_synchronize_rcu
	cscope -d -L -0 get_state_synchronize_rcu_full
	cscope -d -L -0 get_state_synchronize_srcu
	cscope -d -L -0 poll_state_synchronize_rcu
	cscope -d -L -0 poll_state_synchronize_rcu_full
	cscope -d -L -0 same_state_synchronize_rcu
	cscope -d -L -0 same_state_synchronize_rcu_full
	cscope -d -L -0 start_poll_synchronize_rcu
	cscope -d -L -0 start_poll_synchronize_rcu_full
	cscope -d -L -0 start_poll_synchronize_rcu_expedited
	cscope -d -L -0 start_poll_synchronize_rcu_expedited_full
	cscope -d -L -0 start_poll_synchronize_srcu
	cscope -d -L -0 start_poll_synchronize_srcu_expedited
	cscope -d -L -0 poll_state_synchronize_srcu

	# RCU grace-period/quiescent-state control

	cscope -d -L -0 cond_resched_rcu_qs # Dead!!!
	cscope -d -L -0 cond_resched_tasks_rcu_qs
	cscope -d -L -0 rcu_all_qs
	cscope -d -L -0 rcu_softirq_qs_periodic
	cscope -d -L -0 rcu_end_inkernel_boot
	cscope -d -L -0 rcu_expedite_gp
	cscope -d -L -0 rcu_gp_is_expedited
	cscope -d -L -0 rcu_unexpedite_gp

	# RCU-sync primitive

	cscope -d -L -0 rcu_sync_is_idle
	cscope -d -L -0 rcu_sync_init
	cscope -d -L -0 rcu_sync_enter
	cscope -d -L -0 rcu_sync_exit
	cscope -d -L -0 rcu_sync_dtor

	# RCU validation

	cscope -d -L -0 rcu_cpu_stall_reset
	cscope -d -L -0 rcu_head_after_call_rcu
	cscope -d -L -0 rcu_is_watching

) | grep -v '^include/linux/.*rcu.*\.h' | \
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
