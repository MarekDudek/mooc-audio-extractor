#!/bin/bash


echo all: $*
INPUT_REAL_PATH=$(realpath "$1")
OUTPUT_REAL_PATH=$(realpath "${1%.*}.mp3")

echo INPUT_REAL_PATH $INPUT_REAL_PATH
echo OUTPUT_REAL_PATH $OUTPUT_REAL_PATH

./extract-audio-from-to.sh "${INPUT_REAL_PATH}" "${OUTPUT_REAL_PATH}"
