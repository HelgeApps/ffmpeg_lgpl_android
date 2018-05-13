* FFmpeg as LGPL for Android WITHOUT x264 (disabled), building/compiling WITHOUT --enable-gpl/--enable-nonfree (see ffmpeg_build.sh file)

Supported Architecture
----
* armv7
* armv7-neon
* x86

Instructions
----
* Set environment variable
  1. export ANDROID_NDK={Android NDK Base Path}
* Run following commands to compile ffmpeg
  1. sudo apt-get --quiet --yes install build-essential git autoconf libtool pkg-config gperf gettext yasm python-lxml
  2. ./init_update_libs.sh
  3. ./android_build.sh
* To update submodules (FFmpeg) you can use ./init_update_libs.sh command
* Find the executable binary in build directory.

License
----
  Check file LICENSE

Original Project
--------
  This is an edited fork to compile FFmpeg as LGPL without x264 (original project here http://www.writingminds.com)
