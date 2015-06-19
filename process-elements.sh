#!/bin/bash

for ELEMENT in "$@"
do
	echo - processing \"$ELEMENT\"
	RELATIVE_PATH="${ELEMENT#$INPUT_DIR}"
	if [ -d "$ELEMENT" ]; then
		if [ "$ELEMENT" == "${INPUT_DIR}" ]; then
			if [ -d "${OUTPUT_DIR}" ]; then
				echo Error, output directory \"${INPUT_DIR}\" already exists!
				exit 1
			else
				mkdir "${OUTPUT_DIR}"
			fi
		else
			mkdir "${OUTPUT_DIR}/${RELATIVE_PATH}"
		fi
	fi
	if [ -f "$ELEMENT" ]; then
		OUTPUT_FILE=${OUTPUT_DIR}/${RELATIVE_PATH%.*}.mp3
		./extract-audio-from-to.sh "${ELEMENT}" "${OUTPUT_FILE}"
	fi
done
