#!/bin/bash

OUTPUT=/tmp/output_1.txt

if [[ $# -ne 1 ]]; then
	echo "Usage: $0 <input_file>"
	exit 1
fi

## gawk works with ERE, as expected, but most systems get mawk by default;
## unfortunately mawk does not support char classes;
## the workaround using '[ \t]' works for the given example, but is not as good
##  and generic
#gawk '/^[[:space:]]*(#|$)/ || !input_ips[$1]++' $1 > $OUTPUT
awk '/^[ \t]*(#|\r?$)/ || !input_ips[$1]++' $1 > $OUTPUT
