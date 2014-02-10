#!/bin/sh
#
# Produce .html and .tex fragments containing the body of a table mapping
# API members to Linux kernel versions.
#
# Usage: RCUAPImemberstab.sh <awkfrag> <outputbase>
#
# Where "awkfrag" a file containing is the output from RCUAPImembers2awk.sh
# and "outputbase" is the basename of the .dat and .eps output files.
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
# Copyright (C) IBM Corporation, 2014
#
# Authors: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

if test -r "$1"
then
	:
else
	echo The awk-language code fragment file is unreadable: $1
	exit 1
fi

T=/tmp/RCUAPImemberstab.sh.$$
trap 'rm -rf $T' 0
mkdir $T

cat << ___EOF___ > $T/mkdat.awk
BEGIN {
___EOF___
cat $1 >> $T/mkdat.awk
cat << ___EOF___ >> $T/mkdat.awk
}
END {
	for (i = 0; i < numapis; i++) {
		vlist = "";
		inlv = 0;
		lv = "";
		ca = apis[i];
		for (j = 0; j < version; j++) {
			lv = cv;
			cv = versions[j];
			if (API[ca ":" cv] == 1) {
				if (!inlv) {
					inlv = 1;
					if (vlist == "")
						vlist = cv;
					else
						vlist = vlist ", " cv;
				}
			} else {
				if (inlv) {
					inlv = 0;
					vlist = vlist "-" lv;
				}
			}
		}
		if (inlv)
			vlist = vlist "-";
		print "APIversion[\"" ca "\"] = \"" vlist "\";"
	}
}
___EOF___
awk -f $T/mkdat.awk > $T/vertab.awk < /dev/null

cat << ___EOF___ > $T/vertex.awk
BEGIN {
___EOF___
cat $T/vertab.awk >> $T/vertex.awk
cat << ___EOF___ >> $T/vertex.awk
}
END {
	for (i in APIversion) {
		print i " & " APIversion[i] " \\\\\\\\";
	}
}
___EOF___
awk -f $T/vertex.awk < /dev/null | LANG=C sort > $2.tex

cat << ___EOF___ > $T/verhtml.awk
BEGIN {
___EOF___
cat $T/vertab.awk >> $T/verhtml.awk
cat << ___EOF___ >> $T/verhtml.awk
}
END {
	for (i in APIversion) {
		print "<TR><TD>" i "</TD><TD>" APIversion[i] "</TD></TR>";
	}
}
___EOF___
awk -f $T/verhtml.awk < /dev/null | LANG=C sort > $2.html
