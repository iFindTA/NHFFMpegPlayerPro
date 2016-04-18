# NHFFMpegPlayerPro
Movie Player With FFMpeg !(for objc)

## FFMpeg的编译
[简书参考](http://www.jianshu.com/p/ec432a8f5729)
### step1-准备资源：
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

## FFMpeg执行编译时的错误：
＊如果下载源码时卡住不动，请检查网络是否开启了代理（可以切换到全局模式）