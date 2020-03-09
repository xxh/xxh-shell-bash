#!/bin/bash

while getopts f:c:v: option
do
case "${option}"
in
f) EXECUTE_FILE=${OPTARG};;
c) EXECUTE_COMMAND=${OPTARG};;
v) VERBOSE=${OPTARG};;
esac
done

if [[ $EXECUTE_COMMAND ]]; then
  EXECUTE_COMMAND=(-c "${EXECUTE_COMMAND}")
fi

if [[ $EXECUTE_FILE ]]; then
  EXECUTE_COMMAND=""
fi

if [[ $VERBOSE != '' ]]; then
  export XXH_VERBOSE=$VERBOSE
fi

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $CURRENT_DIR

bash $EXECUTE_FILE "${EXECUTE_COMMAND[@]}"