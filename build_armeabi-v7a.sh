#!/bin/bash
SYSROOT=$NDK/platforms/android-14/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
rm -f $(pwd)/compat/strtod.o
function build_one
{
./configure --prefix=$PREFIX $COMMON $CONFIGURATION --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- --target-os=linux --arch=arm --enable-cross-compile --sysroot=$SYSROOT --extra-cflags="-Os -marm $ADDI_CFLAGS" --extra-ldflags="$ADDI_LDFLAGS"

make clean
make -j2
make install
}

export CPU=armeabi-v7a
PREFIX=$(pwd)/android/$CPU
build_one