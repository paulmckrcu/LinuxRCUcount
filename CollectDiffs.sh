#!/bin/sh
#
# Perform differential-profiling runs comparing .sum files of consecutive
# Linux-kernel releases.  This is not part of a normal run.
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

destdir=${1-~/linuxusage}

dodiff () {
	sh sumdiff.sh $destdir/linux-$1.sum $destdir/linux-$2.sum > $destdir/linux-$2.diffs
}

dodiff 2.5.44 2.5.45
dodiff 2.5.45 2.5.46
dodiff 2.5.46 2.5.47
dodiff 2.5.47 2.5.48
dodiff 2.5.48 2.5.49
dodiff 2.5.49 2.5.50
dodiff 2.5.50 2.5.51
dodiff 2.5.51 2.5.52
dodiff 2.5.52 2.5.53
dodiff 2.5.53 2.5.54
dodiff 2.5.54 2.5.55
dodiff 2.5.55 2.5.56
dodiff 2.5.56 2.5.57
dodiff 2.5.57 2.5.58
dodiff 2.5.58 2.5.59
dodiff 2.5.59 2.5.60
dodiff 2.5.60 2.5.61
dodiff 2.5.61 2.5.62
dodiff 2.5.62 2.5.63
dodiff 2.5.63 2.5.64
dodiff 2.5.64 2.5.65
dodiff 2.5.65 2.5.66
dodiff 2.5.66 2.5.67
dodiff 2.5.67 2.5.68
dodiff 2.5.68 2.5.69
dodiff 2.5.69 2.5.70
dodiff 2.5.70 2.5.71
dodiff 2.5.71 2.5.72
dodiff 2.5.72 2.5.73
dodiff 2.5.73 2.5.74
dodiff 2.5.74 2.5.75

dodiff 2.5.75 2.6.0

dodiff 2.6.0 2.6.1
dodiff 2.6.1 2.6.2
dodiff 2.6.2 2.6.3
dodiff 2.6.3 2.6.4
dodiff 2.6.4 2.6.5
dodiff 2.6.5 2.6.6
dodiff 2.6.6 2.6.7
dodiff 2.6.7 2.6.8
dodiff 2.6.8 2.6.9
dodiff 2.6.9 2.6.10
dodiff 2.6.10 2.6.11
dodiff 2.6.11 2.6.12
dodiff 2.6.12 2.6.13
dodiff 2.6.13 2.6.14
dodiff 2.6.14 2.6.15
dodiff 2.6.15 2.6.16
dodiff 2.6.16 2.6.17
dodiff 2.6.17 2.6.18
dodiff 2.6.18 2.6.19
dodiff 2.6.19 2.6.20
dodiff 2.6.20 2.6.21
dodiff 2.6.21 2.6.22
dodiff 2.6.22 2.6.23
dodiff 2.6.23 2.6.24
dodiff 2.6.24 2.6.25
dodiff 2.6.25 2.6.26
dodiff 2.6.26 2.6.27
dodiff 2.6.27 2.6.28
dodiff 2.6.28 2.6.29
dodiff 2.6.29 2.6.30
