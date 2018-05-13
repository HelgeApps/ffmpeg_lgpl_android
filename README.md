Build FFmpeg 3.4 as LGPL for Android WITHOUT x264 (disabled), building/compiling WITHOUT --enable-gpl/--enable-nonfree (see ffmpeg_build.sh file)

Supported Architecture
----
* armv7
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

**Android usage**
* [FFmpeg Android Library](https://github.com/WritingMinds/ffmpeg-android-java) is a java library that simplifies your task of using ffmpeg in Android project

License
----
  Check file LICENSE

Original Project
--------
  This is an edited fork to compile FFmpeg as LGPL without x264 (original project here https://github.com/writingminds/ffmpeg-android)
