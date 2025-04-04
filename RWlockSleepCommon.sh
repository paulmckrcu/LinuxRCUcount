#!/bin/sh
#
# List of cscope queries to gather data on reader-writer sleeplocks.
# Filtering is done by LockAnalysis.sh and RWlockAnalysis.sh, which
# both call this script.
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
# Authors: Paul E. McKenney <paulmckrcu@kernel.org>

## Reader-writer semaphore

# Initialization and cleanup

cscope -d -L -0 __RWSEM_INITIALIZER
cscope -d -L -0 DECLARE_RWSEM
cscope -d -L -0 init_rwsem

# Markers for reader-writer critical sections

cscope -d -L -0 down_read
cscope -d -L -0 down_read_interruptible
cscope -d -L -0 down_read_killable
cscope -d -L -0 down_read_trylock
cscope -d -L -0 down_read_nested
cscope -d -L -0 down_read_non_owner
cscope -d -L -0 up_read
cscope -d -L -0 up_read_non_owner
cscope -d -L -6 "guard\(rwsem_read\)\("
cscope -d -L -6 "scoped_guard\(rwsem_read\)\("
cscope -d -L -6 "scoped_cond_guard\(rwsem_read,"

cscope -d -L -0 down_write
cscope -d -L -0 down_write_killable
cscope -d -L -0 down_write_trylock
cscope -d -L -0 down_write_nest_lock
cscope -d -L -0 up_write
cscope -d -L -0 downgrade_write
cscope -d -L -6 "guard\(rwsem_write\)\("
cscope -d -L -6 "scoped_guard\(rwsem_write\)\("
cscope -d -L -6 "scoped_cond_guard\(rwsem_write,"

# test for lock held

cscope -d -L -0 rwsem_is_locked
cscope -d -L -0 rwsem_is_contended
cscope -d -L -0 rwsem_assert_held
cscope -d -L -0 rwsem_assert_held_write
cscope -d -L -0 rwsem_assert_held_nolockdep
cscope -d -L -0 rwsem_assert_held_write_nolockdep

## Per-CPU reader-writer semaphore

# Initialization and cleanup

cscope -d -L -0 DEFINE_PERCPU_RWSEM
cscope -d -L -0 DEFINE_STATIC_PERCPU_RWSEM

# Markers for reader-writer critical sections

cscope -d -L -0 percpu_down_read
cscope -d -L -0 percpu_down_read_trylock
cscope -d -L -0 percpu_up_read
cscope -d -L -0 percpu_is_read_locked
cscope -d -L -0 percpu_down_write
cscope -d -L -0 percpu_up_write
cscope -d -L -0 percpu_is_write_locked
cscope -d -L -0 percpu_free_rwsem
cscope -d -L -0 __percpu_init_rwsem
cscope -d -L -0 percpu_init_rwsem
cscope -d -L -0 percpu_rwsem_is_held
cscope -d -L -0 percpu_rwsem_assert_held
cscope -d -L -0 percpu_rwsem_acquire
cscope -d -L -0 percpu_rwsem_release
