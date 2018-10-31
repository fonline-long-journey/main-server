# Ubuntu Installation
In order to run FOnlineServer r462 on Ubuntu 16 x64/32 you might need to install libs:
```
sudo apt-get install build-essential lib32z1 libstdc++6:i386 libc6:i386 libgcc1:i386 libstdc++6:i386 gcc-6-base:i386 libxrandr2:i386 libfontconfig1:i386 libfreetype6:i386 libice6:i386 libsm6:i386 libstdc++5:i386 libx11-6:i386 libexpat1:i386  libpng12-0:i386 zlib1g:i386 libuuid1:i386  libxcb1:i386 libxext6:i386 libxrender1:i386 libjpeg62:i386 libxcursor1:i386 libxext6:i386 libxft2:i386 libxft2:i386 libxau6:i386 libxdmcp6:i386 libxfixes3:i386 libxft2 libxinerama1:i386 libc6-dev-i386
```
In order to compile libraries on Linux you'll need:
```
sudo apt-get install gcc-multilib g++-multilib
```
Run: `make .` in `scripts` directory to compile libs.

In order to compile libraries on Windows you'll need Visual Studio 2017 Community Editon & Windows SDK 0.6/0.7a.
Run `make_tla.bat`/`make_ext.bat`/`make_test.bat` to compile libs.