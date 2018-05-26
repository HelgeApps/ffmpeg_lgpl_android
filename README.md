Build FFmpeg 3.2.4 as LGPL shared libraries for Android WITHOUT x264 (and other GPL libraries) and WITHOUT --enable-gpl/--enable-nonfree

FFmpeg code is unmodified here (unchanged)

Supported architectures
----
* armeabi-v7a
* arm64-v8a
* x86
* x86_64

Android Build Instructions
----
* Download NDK r14 
  1. https://developer.android.com/ndk/downloads/older_releases
* Set environment variable
  1. export NDK={Android NDK Base Path}
* Run following commands to compile FFmpeg for Android
  1. sudo apt-get --quiet --yes install build-essential git autoconf libtool pkg-config gperf gettext yasm python-lxml
  2. ./build_all.sh
* Find the shared libraries in android directory.

LICENSE
----
* Check LICENSE.md and COPYING.LGPLv2.1 files
* Also https://www.ffmpeg.org/legal.html
  
More about FFmpeg
----
* https://www.ffmpeg.org/
* https://github.com/FFmpeg/FFmpeg
* https://github.com/FFmpeg/FFmpeg/tree/n3.2.4
