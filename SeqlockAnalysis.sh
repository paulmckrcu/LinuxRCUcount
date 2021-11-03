#!/bin/sh
#
# A script of cscope queries to gather data on seqlocks.
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
# Copyright (C) Facebook, 2021
#
# Authors: Paul E. McKenney <paulmck@kernel.org>

(

	# Sequence counter initialization and cleanup

	cscope -d -L -0 SEQCNT_ZERO
	cscope -d -L -0 seqcount_init
	cscope -d -L -0 seqcount_raw_spinlock_init
	cscope -d -L -0 seqcount_spinlock_init
	cscope -d -L -0 seqcount_rwlock_init
	cscope -d -L -0 seqcount_mutex_init
	cscope -d -L -0 seqcount_ww_mutex_init
	cscope -d -L -0 SEQCNT_RAW_SPINLOCK_ZERO
	cscope -d -L -0 SEQCNT_SPINLOCK_ZERO
	cscope -d -L -0 SEQCNT_RWLOCK_ZERO
	cscope -d -L -0 SEQCNT_MUTEX_ZERO
	cscope -d -L -0 SEQCNT_WW_MUTEX_ZERO

	# Sequence counter readers

	cscope -d -L -0 raw_read_seqcount_begin
	cscope -d -L -0 read_seqcount_begin
	cscope -d -L -0 raw_read_seqcount
	cscope -d -L -0 __read_seqcount_begin
	cscope -d -L -0 raw_seqcount_begin
	cscope -d -L -0 __read_seqcount_retry
	cscope -d -L -0 read_seqcount_retry

	# Sequence counter writers

	cscope -d -L -0 raw_write_seqcount_begin
	cscope -d -L -0 raw_write_seqcount_end
	cscope -d -L -0 write_seqcount_begin_nested
	cscope -d -L -0 write_seqcount_begin
	cscope -d -L -0 write_seqcount_end
	cscope -d -L -0 raw_write_seqcount_barrier
	cscope -d -L -0 write_seqcount_invalidate

	# Sequence latch initialization and cleanup

	cscope -d -L -0 SEQCNT_LATCH_ZERO
	cscope -d -L -0 seqcount_latch_init

	# Sequence latch readers

	cscope -d -L -0 raw_read_seqcount_latch
	cscope -d -L -0 read_seqcount_latch_retry

	# Sequence latch writers

	cscope -d -L -0 raw_write_seqcount_latch

	# Sequence lock initialization and cleanup

	cscope -d -L -0 DEFINE_SEQLOCK
	cscope -d -L -0 seqlock_init

	# Sequence lock readers

	cscope -d -L -0 read_seqbegin
	cscope -d -L -0 read_seqretry
	cscope -d -L -0 read_seqlock_excl
	cscope -d -L -0 read_sequnlock_excl
	cscope -d -L -0 read_seqlock_excl_bh
	cscope -d -L -0 read_sequnlock_excl_bh
	cscope -d -L -0 read_seqlock_excl_irq
	cscope -d -L -0 read_sequnlock_excl_irq
	cscope -d -L -0 read_seqlock_excl_irqsave
	cscope -d -L -0 read_sequnlock_excl_irqrestore
	cscope -d -L -0 read_seqbegin_or_lock
	cscope -d -L -0 need_seqretry
	cscope -d -L -0 done_seqretry
	cscope -d -L -0 read_seqbegin_or_lock_irqsave
	cscope -d -L -0 done_seqretry_irqrestore

	# Sequence lock writers

	cscope -d -L -0 write_seqlock
	cscope -d -L -0 write_sequnlock
	cscope -d -L -0 write_seqlock_bh
	cscope -d -L -0 write_sequnlock_bh
	cscope -d -L -0 write_seqlock_irq
	cscope -d -L -0 write_sequnlock_irq
	cscope -d -L -0 write_seqlock_irqsave
	cscope -d -L -0 write_sequnlock_irqrestore
) | grep -v "File does not have expected format" | \
    grep -v "^$" | \
    sort --key=1,1 --key=3n
