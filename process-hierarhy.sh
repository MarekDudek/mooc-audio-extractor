#!/bin/bash

export INPUT_DIR=$1
export OUTPUT_DIR=$2

echo Processing hierarchy from \"$INPUT_DIR\" to \"$OUTPUT_DIR\"

find "${INPUT_DIR}" -print0 | xargs -0 ./process-elements.sh
