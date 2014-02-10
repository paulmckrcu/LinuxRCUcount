#!/bin/sh
#
# Form a shell variable "api" enumerating all past and current RCU API
# members.  Intended to be sourced, as in: ". RCUAPImembers.sh".
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

api=""

# Markers

api="$api __rcu"

# Initialization and cleanup

api="$api init_srcu_struct"
api="$api cleanup_srcu_struct"
api="$api RCU_HEAD_INIT" # DEAD
api="$api RCU_INIT_POINTER"
api="$api RCU_POINTER_INITIALIZER"
api="$api init_rcu_head_on_stack"
api="$api destroy_rcu_head_on_stack"
api="$api SLAB_DESTROY_BY_RCU"

# Markers for RCU read-side critical sections

api="$api rcu_read_lock"
api="$api rcu_read_unlock"
api="$api rcu_read_lock_bh"
api="$api rcu_read_unlock_bh"
api="$api rcu_read_lock_sched"
api="$api rcu_read_lock_sched_notrace"
api="$api rcu_read_unlock_sched"
api="$api rcu_read_unlock_sched_notrace"
api="$api srcu_read_lock"
api="$api srcu_read_lock_raw"
api="$api srcu_read_unlock"
api="$api srcu_read_unlock_raw"
api="$api RCU_NONIDLE"

# RCU lockdep assertion

api="$api rcu_lockdep_assert"
api="$api rcu_read_lock_held"
api="$api rcu_read_lock_bh_held"
api="$api rcu_read_lock_sched_held"
api="$api rcu_sleep_check"
api="$api srcu_read_lock_held"
api="$api rcu_is_watching"

# RCU pointer/list traversal

api="$api rcu_access_pointer"
api="$api rcu_access_index"
api="$api rcu_dereference"
api="$api rcu_dereference_bh"
api="$api rcu_dereference_bh_check"
api="$api rcu_dereference_bh_protected"
api="$api rcu_dereference_check"
api="$api rcu_dereference_index_check"
api="$api rcu_dereference_protected"
api="$api rcu_dereference_raw"
api="$api rcu_dereference_sched"
api="$api rcu_dereference_sched_check"
api="$api rcu_dereference_sched_protected"
api="$api srcu_dereference"
api="$api srcu_dereference_check"

api="$api list_entry_rcu"
api="$api list_next_rcu"
api="$api list_first_entry_rcu"
api="$api list_for_each_rcu" # Dead!!!
api="$api list_for_each_safe_rcu" # Dead!!!
api="$api list_for_each_entry_rcu"
api="$api list_for_each_continue_rcu" # ->list_for_each_entry_continue_rcu
api="$api list_for_each_entry_continue_rcu"
api="$api hlist_first_rcu"
api="$api hlist_next_rcu"
api="$api hlist_pprev_rcu"
api="$api hlist_for_each_rcu" # Dead!!!
api="$api hlist_for_each_entry_rcu"
api="$api hlist_for_each_entry_rcu_bh"
api="$api hlist_for_each_entry_continue_rcu"
api="$api hlist_for_each_entry_continue_rcu_bh"

api="$api hlist_nulls_first_rcu"
api="$api hlist_nulls_for_each_entry_rcu"

api="$api hlist_bl_first_rcu"
api="$api hlist_bl_for_each_entry_rcu"

# RCU pointer update

api="$api rcu_assign_pointer"
api="$api list_add_rcu"
api="$api list_add_tail_rcu"
api="$api list_del_rcu"
api="$api list_replace_rcu"
api="$api hlist_del_rcu"
api="$api hlist_del_init_rcu"
api="$api hlist_replace_rcu"
api="$api hlist_add_head_rcu"
api="$api hlist_add_before_rcu"
api="$api hlist_add_after_rcu"
api="$api list_splice_init_rcu"

api="$api hlist_nulls_del_init_rcu"
api="$api hlist_nulls_del_rcu"
api="$api hlist_nulls_add_head_rcu"

api="$api hlist_bl_set_first_rcu"
api="$api hlist_bl_del_init_rcu"
api="$api hlist_bl_del_rcu"
api="$api hlist_bl_add_head_rcu"

# RCU grace period

api="$api kfree_rcu"
api="$api call_rcu"
api="$api call_rcu_bh"
api="$api call_rcu_sched"
api="$api call_srcu"
api="$api rcu_barrier"
api="$api rcu_barrier_bh"
api="$api rcu_barrier_sched"
api="$api srcu_barrier"
api="$api synchronize_kernel" # Dead!!!
api="$api synchronize_net"
api="$api synchronize_rcu"
api="$api synchronize_rcu_expedited"
api="$api synchronize_rcu_bh"
api="$api synchronize_rcu_bh_expedited"
api="$api synchronize_sched"
api="$api synchronize_sched_expedited"
api="$api synchronize_srcu"
api="$api synchronize_srcu_expedited"
