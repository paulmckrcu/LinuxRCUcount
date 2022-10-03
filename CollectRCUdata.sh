#!/bin/sh
#
# Collect data on the versions of the kernel specified by the lines
# below that are not commented out.  Normal practice is to edit this
# file on each release, commenting out the line for the prior release
# and adding a line for the current release.
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

destdir=${1-~/paper/RCU/intro/linuxusage}

# sh LinuxRCUcount.sh 2.5.45 ${destdir}
# sh LinuxRCUcount.sh 2.5.46 ${destdir}
# sh LinuxRCUcount.sh 2.5.47 ${destdir}
# sh LinuxRCUcount.sh 2.5.48 ${destdir}
# sh LinuxRCUcount.sh 2.5.49 ${destdir}
# sh LinuxRCUcount.sh 2.5.50 ${destdir}
# sh LinuxRCUcount.sh 2.5.51 ${destdir}
# sh LinuxRCUcount.sh 2.5.52 ${destdir}
# sh LinuxRCUcount.sh 2.5.53 ${destdir}
# sh LinuxRCUcount.sh 2.5.54 ${destdir}
# sh LinuxRCUcount.sh 2.5.55 ${destdir}
# sh LinuxRCUcount.sh 2.5.56 ${destdir}
# sh LinuxRCUcount.sh 2.5.57 ${destdir}
# sh LinuxRCUcount.sh 2.5.58 ${destdir}
# sh LinuxRCUcount.sh 2.5.59 ${destdir}
# sh LinuxRCUcount.sh 2.5.60 ${destdir}
# sh LinuxRCUcount.sh 2.5.61 ${destdir}
# sh LinuxRCUcount.sh 2.5.62 ${destdir}
# sh LinuxRCUcount.sh 2.5.63 ${destdir}
# sh LinuxRCUcount.sh 2.5.64 ${destdir}
# sh LinuxRCUcount.sh 2.5.65 ${destdir}
# sh LinuxRCUcount.sh 2.5.66 ${destdir}
# sh LinuxRCUcount.sh 2.5.67 ${destdir}
# sh LinuxRCUcount.sh 2.5.68 ${destdir}
# sh LinuxRCUcount.sh 2.5.69 ${destdir}
# sh LinuxRCUcount.sh 2.5.70 ${destdir}
# sh LinuxRCUcount.sh 2.5.71 ${destdir}
# sh LinuxRCUcount.sh 2.5.72 ${destdir}
# sh LinuxRCUcount.sh 2.5.73 ${destdir}
# sh LinuxRCUcount.sh 2.5.74 ${destdir}
# sh LinuxRCUcount.sh 2.5.75 ${destdir}

# sh LinuxRCUcount.sh 2.6.0 ${destdir}
# sh LinuxRCUcount.sh 2.6.1 ${destdir}
# sh LinuxRCUcount.sh 2.6.2 ${destdir}
# sh LinuxRCUcount.sh 2.6.3 ${destdir}
# sh LinuxRCUcount.sh 2.6.4 ${destdir}
# sh LinuxRCUcount.sh 2.6.5 ${destdir}
# sh LinuxRCUcount.sh 2.6.6 ${destdir}
# sh LinuxRCUcount.sh 2.6.7 ${destdir}
# sh LinuxRCUcount.sh 2.6.8 ${destdir}
# sh LinuxRCUcount.sh 2.6.9 ${destdir}
# sh LinuxRCUcount.sh 2.6.10 ${destdir}
# sh LinuxRCUcount.sh 2.6.11 ${destdir}
# sh LinuxRCUcount.sh 2.6.12 ${destdir}
# sh LinuxRCUcount.sh 2.6.13 ${destdir}
# sh LinuxRCUcount.sh 2.6.14 ${destdir}
# sh LinuxRCUcount.sh 2.6.15 ${destdir}
# sh LinuxRCUcount.sh 2.6.16 ${destdir}
# sh LinuxRCUcount.sh 2.6.17 ${destdir}
# sh LinuxRCUcount.sh 2.6.18 ${destdir}
# sh LinuxRCUcount.sh 2.6.19 ${destdir}
# sh LinuxRCUcount.sh 2.6.20 ${destdir}
# sh LinuxRCUcount.sh 2.6.21 ${destdir}
# sh LinuxRCUcount.sh 2.6.22 ${destdir}
# sh LinuxRCUcount.sh 2.6.23 ${destdir}
# sh LinuxRCUcount.sh 2.6.24 ${destdir}
# sh LinuxRCUcount.sh 2.6.25 ${destdir}
# sh LinuxRCUcount.sh 2.6.26 ${destdir}
# sh LinuxRCUcount.sh 2.6.27 ${destdir}
# sh LinuxRCUcount.sh 2.6.28 ${destdir}
# sh LinuxRCUcount.sh 2.6.29 ${destdir}
# sh LinuxRCUcount.sh 2.6.30 ${destdir}
# sh LinuxRCUcount.sh 2.6.31 ${destdir}
# sh LinuxRCUcount.sh 2.6.32 ${destdir}
# sh LinuxRCUcount.sh 2.6.33 ${destdir}
# sh LinuxRCUcount.sh 2.6.34 ${destdir}
# sh LinuxRCUcount.sh 2.6.35 ${destdir}
# sh LinuxRCUcount.sh 2.6.36 ${destdir}
# sh LinuxRCUcount.sh 2.6.37 ${destdir}
# sh LinuxRCUcount.sh 2.6.38 ${destdir}
# sh LinuxRCUcount.sh 2.6.39 ${destdir}

# sh LinuxRCUcount.sh 3.0 ${destdir}
# sh LinuxRCUcount.sh 3.1 ${destdir}
# sh LinuxRCUcount.sh 3.2 ${destdir}
# sh LinuxRCUcount.sh 3.3 ${destdir}
# sh LinuxRCUcount.sh 3.4 ${destdir}
# sh LinuxRCUcount.sh 3.5 ${destdir}
# sh LinuxRCUcount.sh 3.6 ${destdir}
# sh LinuxRCUcount.sh 3.7 ${destdir}
# sh LinuxRCUcount.sh 3.8 ${destdir}
# sh LinuxRCUcount.sh 3.9 ${destdir}
# sh LinuxRCUcount.sh 3.10 ${destdir}
# sh LinuxRCUcount.sh 3.11 ${destdir}
# sh LinuxRCUcount.sh 3.12 ${destdir}
# sh LinuxRCUcount.sh 3.13 ${destdir}
# sh LinuxRCUcount.sh 3.14 ${destdir}
# sh LinuxRCUcount.sh 3.15 ${destdir}
# sh LinuxRCUcount.sh 3.16 ${destdir}
# sh LinuxRCUcount.sh 3.17 ${destdir}
# sh LinuxRCUcount.sh 3.18 ${destdir}
# sh LinuxRCUcount.sh 3.19 ${destdir}

# sh LinuxRCUcount.sh 4.0 ${destdir}
# sh LinuxRCUcount.sh 4.1 ${destdir}
# sh LinuxRCUcount.sh 4.2 ${destdir}
# sh LinuxRCUcount.sh 4.3 ${destdir}
# sh LinuxRCUcount.sh 4.4 ${destdir}
# sh LinuxRCUcount.sh 4.5 ${destdir}
# sh LinuxRCUcount.sh 4.6 ${destdir}
# sh LinuxRCUcount.sh 4.7 ${destdir}
# sh LinuxRCUcount.sh 4.8 ${destdir}
# sh LinuxRCUcount.sh 4.9 ${destdir}
# sh LinuxRCUcount.sh 4.10 ${destdir}
# sh LinuxRCUcount.sh 4.11 ${destdir}
# sh LinuxRCUcount.sh 4.12 ${destdir}
# sh LinuxRCUcount.sh 4.13 ${destdir}
# sh LinuxRCUcount.sh 4.14 ${destdir}
# sh LinuxRCUcount.sh 4.15 ${destdir}
# sh LinuxRCUcount.sh 4.16 ${destdir}
# sh LinuxRCUcount.sh 4.17 ${destdir}
# sh LinuxRCUcount.sh 4.18 ${destdir}
# sh LinuxRCUcount.sh 4.19 ${destdir}
# sh LinuxRCUcount.sh 4.20 ${destdir}

# sh LinuxRCUcount.sh 5.0 ${destdir}
# sh LinuxRCUcount.sh 5.1 ${destdir}
# sh LinuxRCUcount.sh 5.2 ${destdir}
# sh LinuxRCUcount.sh 5.3 ${destdir}
# sh LinuxRCUcount.sh 5.4 ${destdir}
# sh LinuxRCUcount.sh 5.5 ${destdir}
# sh LinuxRCUcount.sh 5.6 ${destdir}
# sh LinuxRCUcount.sh 5.7 ${destdir}
# sh LinuxRCUcount.sh 5.8 ${destdir}
# sh LinuxRCUcount.sh 5.9 ${destdir}
# sh LinuxRCUcount.sh 5.10 ${destdir}
# sh LinuxRCUcount.sh 5.11 ${destdir}
# sh LinuxRCUcount.sh 5.12 ${destdir}
# sh LinuxRCUcount.sh 5.13 ${destdir}
# sh LinuxRCUcount.sh 5.14 ${destdir}
# sh LinuxRCUcount.sh 5.15 ${destdir}
# sh LinuxRCUcount.sh 5.16 ${destdir}
# sh LinuxRCUcount.sh 5.17 ${destdir}
# sh LinuxRCUcount.sh 5.18 ${destdir}
# sh LinuxRCUcount.sh 5.19 ${destdir}
sh LinuxRCUcount.sh 6.0 ${destdir}
