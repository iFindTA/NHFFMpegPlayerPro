# NHFFMpegPlayerPro
Movie Player With FFMpeg !(for objc)

## FFMpeg的编译
[简书参考](http://www.jianshu.com/p/ec432a8f5729)
### 准备资源：
```
1、gas-preprocessor
2、yasm
3、FFmpeg-iOS-build-script
```

#### 1.1-> gas-preprocessor的安装：
```
gas-preprocessor 其实就是我们要编译 FFmpeg 的所需脚本文件。
```

＊下载[gas-preprocessor](https://github.com/libav/gas-preprocessor)

＊解压后如下图：

![image](https://raw.githubusercontent.com/iFindTA/screenshots/master/ffmpeg_0.png)

将 gas-preprocessor.pl 文件复制到 /usr/sbin/ 目录下（ps：应该会有很多小伙伴发现这个目录是根本没法修改的，那么这种情况下，小伙伴们可以将文件复制到 /usr/local/bin/ 目录下），然后为文件开启可执行权限，打开终端并输入以下命令行：
```
	chmod 777 /usr/sbin/gas-preprocessor.pl
```
或
```
	chmod 777 /usr/local/bin/gas-preprocessor.pl
```
#### 1.2-> yasm的安装：
```
Yasm是一个完全重写的 NASM 汇编。目前，它支持x86和AMD64指令集，接受NASM和气体汇编语法，
产出二进制，ELF32 ， ELF64 ， COFF ， Mach - O的（ 32和64 ），RDOFF2 ，的Win32和Win64对象的格式，
并生成STABS 调试信息的来源，DWARF 2 ，CodeView 8格式。
```
＊下载、安装使用home brew 一行搞定
```
	brew install yasm
```
#### 1.3-> FFmpeg-iOS-build-script的编译：
```
这个脚本是转为 iOS 编译出可用的 ffmpeg 的库，有了这个脚本，我们根本就不用下载 ffmpeg 了，脚本会帮我们下载好最新版本的 ffmpeg，
并打包成一个 iOS 可用的 ffmpeg 库提供给我们了!大神之作！
```
＊下载[FFmpeg-iOS-build-script](https://github.com/kewlbear/FFmpeg-iOS-build-script)

＊解压后如图：

![image](https://raw.githubusercontent.com/iFindTA/screenshots/master/ffmpeg_1.png)

选择对应的版本执行脚本即可！
执行完毕后得到如下结果：

![image](https://raw.githubusercontent.com/iFindTA/screenshots/master/ffmpeg_2.png)

## FFMpeg集成Xcode Project：
直接把ffmpeg-iOS文件加入到工程中即可：

![image](https://raw.githubusercontent.com/iFindTA/screenshots/master/ffmpeg_3.png)

```
extend library：
libz.dylib
libbz2.dylib
libiconv.dylib
CoreMedia.framwork
AVFoundation.framwork
```


## FFMpeg遇到的错误：
```
＊如果下载源码时卡住不动，请检查网络是否开启了代理（可以切换到全局模式）
＊编译的时候报错： 'libavcodec/avcodec.h' file not found ，修改Header search paths 里的路径：$(PROJECT_DIR)/vendor/FFmpeg-iOS/include
```


## SDL的编译
使用系统播放音频只能播放iOS平台支持的音频格式，SDL播放音频则没有限制
### 准备资源：[SDL官网](http://www.sdltutorials.com/)下载源码，解压后如下：

![image](https://raw.githubusercontent.com/iFindTA/screenshots/master/ffmpeg_4.png)

###SDL编译：
很简单，如上图直接打开SDL.xcodeproj工程和编译普通静态库一样编译你需要的对应平台的.a静态库即可得到libSDL2.a文件，如下：

![image](https://raw.githubusercontent.com/iFindTA/screenshots/master/ffmpeg_5.png)

### SDL引入Xcode工程：
直接拖入工程编译报错：
```

Undefined symbols for architecture arm64:
  "_SDL_main", referenced from:
      -[SDLUIKitDelegate postFinishLaunch] in libSDL2.a(SDL_uikitappdelegate.o)
ld: symbol(s) not found for architecture arm64
clang: error: linker command failed with exit code 1 (use -v to see invocation)
```
解决办法：
在Other Link Flag去掉-Objc/$(inherited)标示可以编译成功！
如有小伙伴有更好的解决办法，请发邮件到:nanhujiaju@gmail.com

```
extend library：
CoreAudio.framwork
CoreMotion.framwork
AudioToolbox.framework
GameController.framework
```
## KxMovieExample的使用
KxmovieExample支持RTSP、RTMP、HTTP等协议下的视频播放，具体可见[官网](https://github.com/kolyvan/kxmovie),很强大，只是未使用到SDL处理音频，已经能满足大部分的需求。(FFPlay默认使用SDL处理音、视频)
需要引入系统库：
```
CoreGraphics.framework
QuartCore.framework
OpenGLES.framework
CoreVideo.framework
VideoToolbox.framework
```
