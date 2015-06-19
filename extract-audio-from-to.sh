#!/bin/bash

INPUT_REAL_PATH=$(realpath "$1")
OUTPUT_REAL_PATH=$(realpath "$2")

ffmpeg -i "${INPUT_REAL_PATH}" -map 0:a -c libmp3lame -q:a 2 -f mp3 "${OUTPUT_REAL_PATH}"
