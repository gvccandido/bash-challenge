#!/bin/bash

OUTPUT=/tmp/output_1.txt

if [[ $# -ne 1 ]]; then
	echo "Usage: $0 <input_file>"
	exit 1
fi

dos2unix --quiet $1
awk '/^($|#)/ || !input_ips[$1]++' $1 > $OUTPUT
