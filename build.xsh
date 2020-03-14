#!/usr/bin/env xonsh

import sys, argparse
from sys import exit
from shutil import which

parser = argparse.ArgumentParser(description='build')
parser.add_argument('-q', '--quiet', action='store_true', help=f"Quiet mode")
opt = parser.parse_args()

def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

script_dir = pf"{__file__}".absolute().parent
build_dir = script_dir / 'build'
rm -rf @(build_dir)/
mkdir -p @(build_dir)

cp @(script_dir / 'entrypoint.sh') @(build_dir)/
cp @(script_dir / 'bashrc') @(build_dir)/
