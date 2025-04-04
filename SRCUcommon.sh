#!/bin/sh
#
# Issues common-code cscope queries to gather data on SRCU.
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

# SRCU initialization and cleanup

cscope -d -L -0 init_srcu_struct
cscope -d -L -0 cleanup_srcu_struct
cscope -d -L -0 DEFINE_SRCU
cscope -d -L -0 DEFINE_STATIC_SRCU

# Markers for SRCU read-side critical sections

cscope -d -L -0 srcu_read_lock
cscope -d -L -0 srcu_read_lock_fast
cscope -d -L -0 srcu_read_lock_nmisafe
cscope -d -L -0 srcu_read_lock_raw # Dead!!!
cscope -d -L -0 srcu_read_lock_notrace
cscope -d -L -0 srcu_read_unlock
cscope -d -L -0 srcu_read_unlock_fast
cscope -d -L -0 srcu_read_unlock_nmisafe
cscope -d -L -0 srcu_read_unlock_raw # Dead!!!
cscope -d -L -0 srcu_read_unlock_notrace
cscope -d -L -0 srcu_down_read
cscope -d -L -0 srcu_down_read_fast
cscope -d -L -0 srcu_up_read
cscope -d -L -0 srcu_up_read_fast
cscope -d -L -0 smp_mb__after_srcu_read_unlock
cscope -d -L -6 "guard\(srcu\)\("
cscope -d -L -6 "scoped_guard\(srcu,"

# SRCU lockdep assertion

cscope -d -L -0 srcu_read_lock_held

# SRCU pointer/list traversal

cscope -d -L -0 srcu_dereference
cscope -d -L -0 srcu_dereference_check
cscope -d -L -0 srcu_dereference_notrace

cscope -d -L -0 list_for_each_entry_srcu
cscope -d -L -0 hlist_for_each_entry_srcu

# SRCU grace period

cscope -d -L -0 call_srcu
cscope -d -L -0 srcu_barrier
cscope -d -L -0 synchronize_srcu
cscope -d -L -0 synchronize_srcu_expedited

# SRCU polled grace period

cscope -d -L -0 get_state_synchronize_srcu
cscope -d -L -0 start_poll_synchronize_srcu
cscope -d -L -0 start_poll_synchronize_srcu_expedited
cscope -d -L -0 poll_state_synchronize_srcu
