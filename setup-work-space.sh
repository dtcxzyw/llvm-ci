#!/bin/bash
set -euo pipefail
shopt -s inherit_errexit

BASE_DIR=$1

mkdir -p $BASE_DIR
mkdir -p $BASE_DIR/binaries
mkdir -p $BASE_DIR/artifacts
rm -rf $BASE_DIR/artifacts/*
echo "PYTHONPYCACHEPREFIX=$BASE_DIR/__pycache__/" >> $GITHUB_ENV
