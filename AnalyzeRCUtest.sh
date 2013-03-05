#!/bin/sh
#
# Test script -- collects many kernel source trees, analyzes them
# and plots the results, but puts the results into a /tmp directory.
# As with the main script, edit CollectRCUdata.sh to change the
# kernel releases to be used.
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

outdir=/tmp/linuxusage		# Created if need be.

sh CollectRCUdata.sh ${outdir}

scriptdir=`pwd`
cd ${outdir}
sh ${scriptdir}/plots.sh
