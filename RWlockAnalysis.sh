#!/bin/sh
#
# List of cscope queries to gather data on reader-writer spinlocks.
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

	# Initialization and cleanup

	cscope -d -L -0 DEFINE_RWLOCK
	cscope -d -L -0 RW_LOCK_UNLOCKED

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
	cscope -d -L -0 write_unlock
	cscope -d -L -0 write_unlock_bh
	cscope -d -L -0 write_unlock_irq
	cscope -d -L -0 write_unlock_irqrestore
) | grep -v "File does not have expected format" | \
    grep -v "^$" | \
    sort --key=1,1 --key=3n
