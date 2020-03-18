#!/usr/bin/env bash

CDIR="$(cd "$(dirname "$0")" && pwd)"

while getopts q: option
do
  case "${option}"
  in
    q) QUIET=${OPTARG};;
  esac
done

build_dir=$CDIR/build

rm -rf $build_dir
mkdir -p $build_dir

for f in entrypoint.sh bashrc
do
    cp $CDIR/$f $build_dir/
done
