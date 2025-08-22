#!/bin/bash

TEMP_DIR=$(mktemp -d)
chmod 700 "$TEMP_DIR"
cd "$TEMP_DIR"

git clone --branch 0.12 --depth 1 https://github.com/jedisct1/minisign.git

cd minisign
mkdir build
cd build
cmake ..
make
cp minisign $HOME/.local/bin/

rm -rf $TEMP_DIR