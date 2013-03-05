#!/bin/sh
#
# A script of cscope queriees to gather data on sleeplocks.
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

	cscope -d -L -0 init_sema
	cscope -d -L -0 initsema
	cscope -d -L -0 initnsema
	cscope -d -L -0 sema_init

	# Markers for exclusive critical sections

	cscope -d -L -0 down
	cscope -d -L -0 down_interruptible
	cscope -d -L -0 down_trylock
	cscope -d -L -0 up

	# XFS mappings (probably others as well, but...)

	cscope -d -L -0 psema
	cscope -d -L -0 cpsema
	cscope -d -L -0 vsema
	cscope -d -L -0 valusema
	cscope -d -L -0 freesema
) | grep -v "File does not have expected format" | \
    grep -v "^$" | \
    sort --key=1,1 --key=3n
