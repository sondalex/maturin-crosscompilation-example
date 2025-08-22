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

INSTALL_DIR="$HOME/.local/bin/"
mkdir -p "$INSTALL_DIR"
cp minisign $INSTALL_DIR



rm -rf $TEMP_DIR
