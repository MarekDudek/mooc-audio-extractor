#!/bin/bash

INPUT_ROOT="$1"

find "${INPUT_ROOT}" -name '*.mp4' -print0 | xargs -0 ./i-accept-from-find.sh
