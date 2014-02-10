#!/bin/sh
#
# A script of csscope queries to gather data on reader-writer semaphores.
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

) | grep -v "File does not have expected format" | \
    grep -v "^$" | \
    sort --key=1,1 --key=3n
