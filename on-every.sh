#!/bin/bash

echo On every element
echo output is ${OUTPUT_DIR}

for path in "$@"
do
	if [ -d "$path" ]; then
		echo - directory $path
	fi
	if [ -f "$path" ]; then
		echo - file $path 
	fi
done
