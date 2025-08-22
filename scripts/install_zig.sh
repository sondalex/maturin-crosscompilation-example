#!/bin/bash
set -e

TEMP_DIR=$(mktemp -d)
chmod 700 "$TEMP_DIR"
cd "$TEMP_DIR"

cd $TEMP_DIR
echo "Downloading zig"

wget -q https://ziglang.org/download/0.15.1/zig-x86_64-linux-0.15.1.tar.xz 
wget -q https://ziglang.org/download/0.15.1/zig-x86_64-linux-0.15.1.tar.xz.minisig

if command -v minisign &> /dev/null; then
    if minisign -Vm zig-x86_64-linux-0.15.1.tar.xz -P RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U;then
        echo "Signature verification succeeded"
    else
        echo "Signature verification failed"
        rm -rf $TEMP_DIR
        exit 1
    fi
else
    echo "minisign not found. Install it"
    rm -rf $TEMP_DIR
    exit 1
fi

echo "Extracting zig"
    

tar -xJf zig-x86_64-linux-0.15.1.tar.xz

INSTALL_DIR="$HOME/.local/zig/0.15.1"
mkdir -p "$INSTALL_DIR"
mv zig-*/* "$INSTALL_DIR/"

echo "Zig installed to $INSTALL_DIR"
echo "Consider adding $INSTALL_DIR to your PATH"

rm -rf $TEMP_DIR

