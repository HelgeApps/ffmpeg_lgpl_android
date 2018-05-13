#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd ffmpeg

case $1 in
  armeabi-v7a | armeabi-v7a-neon)
    CPU='cortex-a8'
  ;;
  x86)
    CPU='i686'
  ;;
esac

make clean

./configure \
--target-os="$TARGET_OS" \
--cross-prefix="$CROSS_PREFIX" \
--arch="$NDK_ABI" \
--cpu="$CPU" \
--enable-runtime-cpudetect \
--sysroot="$NDK_SYSROOT" \
--enable-pic \
--disable-small \ # optimize for final binary size (not speed)
--disable-avcodec \ # building libavcodec (codec support)
# --enable-avformat \ # building libavformat (mux/demux support)
--disable-postproc \
--disable-avdevice \
--disable-avfilter \ # building libavfilter (filter/resize support)
--disable-swresample \ # building libswresample (audio resampling support)
--disable-swscale \ # building libswscale (video/image resizing support)
--disable-decoder=h264 \ # building libavcodec with H.264 decoding support
--disable-encoder=rawvideo,libx264 \ # enable building libavcodec with raw video and H.264 (via libx264) encoding support
--disable-parser=h264 \ # H.264 packet parsing - required for H.264 decoding
# --enable-protocol=file \ # file read/write support
--enable-demuxer=mov \ # demuxing of MOV-type files (includes MP4)
# --enable-muxer=rawvideo,mp4 \ # enable muxing to raw video and MP4
--disable-filter=scale \ # scaling (resizing) filter for videos in libavfilter
--disable-libx264 \
--disable-libx265 \
--disable-libass \
--disable-libfreetype \
--disable-libfribidi \
--disable-libmp3lame \
--disable-fontconfig \
--enable-pthreads \
--disable-debug \
--disable-ffserver \
--enable-version3 \
--enable-hardcoded-tables \
--disable-ffplay \
--disable-ffprobe \
--enable-yasm \
--disable-doc \
--disable-shared \
--enable-static \
--pkg-config="${2}/ffmpeg-pkg-config" \
--prefix="${2}/build/${1}" \
--extra-cflags="-I${TOOLCHAIN_PREFIX}/include $CFLAGS" \
--extra-ldflags="-L${TOOLCHAIN_PREFIX}/lib $LDFLAGS" \
--extra-libs="-lm" \
--extra-cxxflags="$CXX_FLAGS" || exit 1

#--extra-libs="-lpng -lexpat -lm" \

make -j${NUMBER_OF_CORES} && make install || exit 1

popd
