#!/bin/bash

INPUT_DIR=$1
export OUTPUT_DIR=$2

echo Processing hierarchy
echo From $INPUT_DIR to $OUTPUT_DIR

find "${INPUT_DIR}" -print0 | xargs -0 ./on-every.sh
