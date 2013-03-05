#!/bin/sh
#
# Issues cscope queries to gather data on memory-barrier primitives
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

	cscope -d -L -0 mb
	cscope -d -L -0 rmb
	cscope -d -L -0 wmb
	cscope -d -L -0 smp_mb
	cscope -d -L -0 smp_rmb
	cscope -d -L -0 smp_wmb
	cscope -d -L -0 smp_read_barrier_depends
	cscope -d -L -0 smp_mb__before_atomic_dec
	cscope -d -L -0 smp_mb__after_atomic_dec
	cscope -d -L -0 smp_mb__before_atomic_inc
	cscope -d -L -0 smp_mb__after_atomic_inc
) | grep '[a-z] *()' |
    sort --key=1,1 --key=3n
