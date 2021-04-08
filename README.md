# libgdiplus-android
适用于Android的 [libgdiplus](https://github.com/mono/libgdiplus)

主要用于解决 **Unity** 安卓平台无法使用 `System.Drawing.dll` 插件的问题

## 下载NDK
https://developer.android.com/ndk/downloads/older_releases.html

## 编译
```
ndk-build
```

如果编译失败，请尝试：ndk-r22b、ndk-r21e、ndk-r15b、ndk-r10e

## 使用到的库
|    名称    |   版本   |
| ---------- | -------- |
| cairo      |  1.15.2  |
| fontconfig |  2.13.1  |
| freetype   |  2.10.1  |
| glib       |  2.40.2  |
| libexpat   |  2.0.1   |
| libgif     |  5.2.1   |
| libiconv   |  1.16    |
| libjpeg    |          |
| libpng     |  1.6.10  |
| libuuid    |  1.0.3   |
| pixman     |  0.38.4  |
