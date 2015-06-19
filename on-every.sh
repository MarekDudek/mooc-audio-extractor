#!/bin/bash

for ELEMENT in "$@"
do
	if [ -d "$ELEMENT" ]; then
		if [ "$ELEMENT" == "${INPUT_DIR}" ]; then
			echo -- root of the input hierarchy detected, creating root of output hierarchy
			if [ -d "${OUTPUT_DIR}" ]; then
				echo Error, output directory ${INPUT_DIR} already exists!
				#exit 1
			else
				mkdir "${OUTPUT_DIR}"
			fi
		else
			echo -- creating subdirectory $ELEMENT
			OUTPUT_SUBDIR="${ELEMENT#$INPUT_DIR}"
			mkdir "${OUTPUT_DIR}/${OUTPUT_SUBDIR}"
		fi
	fi
	if [ -f "$ELEMENT" ]; then
		echo - file $ELEMENT 
		INPUT_FILE="$ELEMENT"
		INPUT_FILE_BASENAME="$(basename "$INPUT_FILE")"
		INPUT_FILE_DIRNAME="$(dirname "$INPUT_FILE")"
		OUTPUT_SUBDIR="${ELEMENT#$INPUT_DIR}"
		OUTPUT_FILE=${OUTPUT_DIR}/${OUTPUT_SUBDIR%.*}.mp3
		echo ! Extracting "$INPUT_FILE" to "$OUTPUT_FILE"
		echo ! INPUT "$INPUT_FILE"
		echo ! OUTPUT "$OUTPUT_FILE"
		./extract-audio-from-to.sh "${INPUT_FILE}" "${OUTPUT_FILE}"
	fi
done
