#!/bin/bash

COURSE_TITLE="$(basename "$INPUT_DIR")"
ARTIST=$COURSE_TITLE

for ELEMENT in "$@"
do
	echo - processing \"$ELEMENT\"
	RELATIVE_PATH="${ELEMENT#$INPUT_DIR}"
	if [ -d "$ELEMENT" ]; then
		DIR_TO_MAKE="${OUTPUT_DIR}/${RELATIVE_PATH}"
		if [ -d "${DIR_TO_MAKE}" ]; then
			echo Error, output directory \"${DIR_TO_MAKE}\" already exists! ; exit 1
		else
			mkdir "${DIR_TO_MAKE}"
		fi
	fi
	if [ -f "$ELEMENT" ]; then
		OUTPUT_FILE=${OUTPUT_DIR}/${RELATIVE_PATH%.*}.mp3
		./extract-audio-from-to.sh "${ELEMENT}" "${OUTPUT_FILE}"
		eyeD3 --remove-all "${OUTPUT_FILE}"
		LECTURE_TITLE="$(basename "$(dirname "$ELEMENT")")"
		ALBUM=$LECTURE_TITLE
		eyeD3   --artist "$ARTIST" \
			--album  "$ALBUM"  \
			"${OUTPUT_FILE}"
	fi
done
