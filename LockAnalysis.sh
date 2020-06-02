#!/bin/sh
#
# Issue cscope queries to gather data on locking.
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

## Reader-writer lock.

# Initialization and cleanup

cscope -d -L -0 DEFINE_RWLOCK
cscope -d -L -0 __RW_LOCK_UNLOCKED
cscope -d -L -0 rwlock_init

# Markers for reader-writer critical sections

cscope -d -L -0 read_lock
cscope -d -L -0 read_lock_bh
cscope -d -L -0 read_lock_irq
cscope -d -L -0 read_lock_irqsave
cscope -d -L -0 read_trylock
cscope -d -L -0 read_unlock
cscope -d -L -0 read_unlock_bh
cscope -d -L -0 read_unlock_irq
cscope -d -L -0 read_unlock_irqrestore

cscope -d -L -0 write_lock
cscope -d -L -0 write_lock_bh
cscope -d -L -0 write_lock_irq
cscope -d -L -0 write_lock_irqsave
cscope -d -L -0 write_trylock
cscope -d -L -0 write_trylock_irqsave
cscope -d -L -0 write_unlock
cscope -d -L -0 write_unlock_bh
cscope -d -L -0 write_unlock_irq
cscope -d -L -0 write_unlock_irqrestore

## Reader-writer semaphore

# Initialization and cleanup

cscope -d -L -0 DECLARE_RWSEM

# Markers for reader-writer critical sections

cscope -d -L -0 down_read
cscope -d -L -0 down_read_trylock
cscope -d -L -0 down_write
cscope -d -L -0 down_write_trylock
cscope -d -L -0 up_read
cscope -d -L -0 up_write
cscope -d -L -0 downgrade_write

# test for lock held

cscope -d -L -0 rwsem_is_locked

## Mutexes

# Initialization and cleanup

cscope -d -L -0 mutex_init
cscope -d -L -0 DEFINE_MUTEX

# Exclusive critical sections

cscope -d -L -0 mutex_lock
cscope -d -L -0 mutex_lock_interruptible
cscope -d -L -0 mutex_lock_killable
cscope -d -L -0 mutex_lock_nested
cscope -d -L -0 mutex_lock_nest_lock
cscope -d -L -0 mutex_trylock
cscope -d -L -0 atomic_dec_and_mutex_lock
cscope -d -L -0 mutex_unlock

# Test for lock held

cscope -d -L -0 mutex_is_locked

## RT Mutexes

# Initialization and cleanup

cscope -d -L -0 DEFINE_RT_MUTEX
cscope -d -L -0 rt_mutex_destroy

# Exclusive critical sections

cscope -d -L -0 rt_mutex_lock
cscope -d -L -0 rt_mutex_lock_interruptible
cscope -d -L -0 rt_mutex_timed_lock
cscope -d -L -0 rt_mutex_trylock
cscope -d -L -0 rt_mutex_unlock

# Test for lock held

cscope -d -L -0 rt_mutex_is_locked

## Exclusive semaphores

# Initialization and cleanup

cscope -d -L -0 DEFINE_SEMAPHORE
cscope -d -L -0 init_sema
cscope -d -L -0 initsema
cscope -d -L -0 initnsema
cscope -d -L -0 sema_init

# Markers for exclusive critical sections

cscope -d -L -0 down
cscope -d -L -0 down_interruptible
cscope -d -L -0 down_killable
cscope -d -L -0 down_timeout
cscope -d -L -0 down_trylock
cscope -d -L -0 up

# XFS mappings (probably others as well, but...)

cscope -d -L -0 psema
cscope -d -L -0 cpsema
cscope -d -L -0 vsema
cscope -d -L -0 valusema
cscope -d -L -0 freesema

## Exclusive spinlocks

# Initialization and cleanup

cscope -d -L -0 DEFINE_RAW_SPINLOCK
cscope -d -L -0 DEFINE_SPINLOCK
cscope -d -L -0 raw_spin_lock_init
cscope -d -L -0 spin_lock_init
cscope -d -L -0 SPIN_LOCK_UNLOCKED

# Markers for exclusive critical sections

cscope -d -L -0 do_raw_spin_lock_flags
cscope -d -L -0 do_raw_spin_trylock
cscope -d -L -0 do_raw_spin_unlock
cscope -d -L -0 raw_spin_can_lock
cscope -d -L -0 raw_spin_lock
cscope -d -L -0 raw_spin_lock_bh
cscope -d -L -0 raw_spin_lock_irq
cscope -d -L -0 raw_spin_lock_irqsave
cscope -d -L -0 raw_spin_lock_irqsave_nested
cscope -d -L -0 raw_spin_lock_nested
cscope -d -L -0 raw_spin_lock_nest_lock
cscope -d -L -0 raw_spin_trylock
cscope -d -L -0 raw_spin_trylock_bh
cscope -d -L -0 raw_spin_trylock_irq
cscope -d -L -0 raw_spin_trylock_irqsave
cscope -d -L -0 raw_spin_unlock
cscope -d -L -0 raw_spin_unlock_bh
cscope -d -L -0 raw_spin_unlock_irq
cscope -d -L -0 raw_spin_unlock_irqrestore
cscope -d -L -0 raw_spin_unlock_wait

cscope -d -L -0 atomic_dec_and_lock
cscope -d -L -0 spin_lock
cscope -d -L -0 spin_lock_bh
cscope -d -L -0 spin_lock_irq
cscope -d -L -0 spin_lock_irqsave
cscope -d -L -0 raw_spin_lock_irqsave_nested
cscope -d -L -0 spin_lock_mutex
cscope -d -L -0 spin_lock_nested
cscope -d -L -0 spin_lock_nest_lock
cscope -d -L -0 spin_trylock
cscope -d -L -0 spin_trylock_bh
cscope -d -L -0 spin_trylock_irq
cscope -d -L -0 spin_trylock_irqsave
cscope -d -L -0 spin_unlock
cscope -d -L -0 spin_unlock_bh
cscope -d -L -0 spin_unlock_irq
cscope -d -L -0 spin_unlock_irqrestore
cscope -d -L -0 spin_unlock_mutex
cscope -d -L -0 spin_unlock_wait

# Markers for lock held

cscope -d -L -0 assert_spin_locked
cscope -d -L -0 raw_spin_is_contended
cscope -d -L -0 raw_spin_is_locked
cscope -d -L -0 spin_can_lock
cscope -d -L -0 spin_is_contended
cscope -d -L -0 spin_is_locked

## lglocks

cscope -d -L -0 DEFINE_LGLOCK
cscope -d -L -0 DECLARE_LGLOCK
cscope -d -L -0 lg_lock_init
cscope -d -L -0 lg_lock_init
cscope -d -L -0 lg_local_lock
cscope -d -L -0 lg_local_unlock
cscope -d -L -0 lg_local_lock_cpu
cscope -d -L -0 lg_local_unlock_cpu
cscope -d -L -0 lg_global_lock
cscope -d -L -0 lg_global_unlock
cscope -d -L -0 lg_global_lock_online
cscope -d -L -0 lg_global_unlock_online

cscope -d -L -0 DECLARE_BRLOCK
cscope -d -L -0 DEFINE_BRLOCK
cscope -d -L -0 br_lock_init
cscope -d -L -0 br_read_lock
cscope -d -L -0 br_read_unlock
cscope -d -L -0 br_write_lock
cscope -d -L -0 br_write_unlock

## seqlocks -- include the locked write side, but not the read side
#		because the read side is not a lock.

cscope -d -L -0 DEFINE_SEQLOCK
cscope -d -L -0 write_seqlock
cscope -d -L -0 write_seqlock_irqsave
cscope -d -L -0 write_seqlock_irq
cscope -d -L -0 write_seqlock_bh
cscope -d -L -0 write_tryseqlock
cscope -d -L -0 write_sequnlock
cscope -d -L -0 write_sequnlock_irqrestore
cscope -d -L -0 write_sequnlock_irq
cscope -d -L -0 write_sequnlock_bh
