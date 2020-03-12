#!/bin/bash

while getopts f:c:v:e: option
do
case "${option}"
in
f) EXECUTE_FILE=${OPTARG};;
c) EXECUTE_COMMAND=${OPTARG};;
v) VERBOSE=${OPTARG};;
e) ENV+=("$OPTARG");;
esac
done

if [[ $VERBOSE != '' ]]; then
  export XXH_VERBOSE=$VERBOSE
fi

if [[ $EXECUTE_COMMAND ]]; then
  EXECUTE_COMMAND=(-c "${EXECUTE_COMMAND}")
fi

if [[ $EXECUTE_FILE ]]; then
  EXECUTE_COMMAND=""
fi

for env in "${ENV[@]}"; do
  name="$( cut -d '=' -f 1 <<< "$env" )";
  val="$( cut -d '=' -f 2- <<< "$env" )";
  val=`echo $val | base64 -d`

  if [[ $XXH_VERBOSE == '1' ]]; then
    echo Environment variable "$env": name=$name, value=$val
  fi

  export $name="$val"
done

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $CURRENT_DIR

export XXH_HOME=`realpath -m $CURRENT_DIR/../../../../`
export HISTFILE=$XXH_HOME/.bash_history

bash --rcfile bashrc $EXECUTE_FILE "${EXECUTE_COMMAND[@]}"