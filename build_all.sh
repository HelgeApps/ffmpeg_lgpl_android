#!/bin/bash
# DON'T FORGET to set NDK path, e.g.: NDK = path/to/ndk-bundle
export ADDI_CFLAGS="-fPIC"
export ADDI_LDFLAGS="-Wl,-z,defs"
export COMMON="--disable-static --disable-programs --disable-doc --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-shared --disable-protocols --enable-protocol=file --enable-pic --enable-version3 --disable-hwaccels --disable-parsers --disable-bsfs --disable-indevs --disable-outdevs --disable-devices --disable-filters --disable-network"
./build_armeabi-v7a.sh
./build_arm64-v8a.sh
./build_x86.sh
./build_x86_64.sh