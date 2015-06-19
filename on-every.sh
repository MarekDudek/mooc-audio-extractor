#!/bin/bash

for ELEMENT in "$@"
do
	if [ -d "$ELEMENT" ]; then
		echo - directory $ELEMENT
		if [ "$ELEMENT" == "${INPUT_DIR}" ]; then
			echo -- root of the input hierarchy detected, creating root of output hierarchy
			if [ -d "${OUTPUT_DIR}" ]; then
				echo Error, output directory ${INPUT_DIR} already exists!
				exit 1
			else
				mkdir "${OUTPUT_DIR}"
			fi
		else
			OUTPUT_SUBDIR="${ELEMENT#$INPUT_DIR}"
			mkdir "${OUTPUT_DIR}/${OUTPUT_SUBDIR}"
		fi
	fi
	if [ -f "$ELEMENT" ]; then
		echo - file $ELEMENT 
	fi
done
