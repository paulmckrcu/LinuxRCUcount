#!/bin/sh
#
# Main script -- collects many kernel source trees, analyzes them
# and plots the results.  Edit CollectRCUdata.sh to add Linux kernel
# releases.
#
# Please note that this may be run incrementally as new releases come
# out.  If the output directory ("outdir=" below) contains old data,
# the new data collected will be accumulated into this pre-existing
# output directory.  So you would normally just run on the new release,
# commenting all prior releases out of CollectRCUdata.sh.
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

outdir=../linuxusage		# Created if need be.

sh CollectRCUdata.sh ${outdir}

scriptdir=`pwd`
cd ${outdir}
sh ${scriptdir}/plots.sh
