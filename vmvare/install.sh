#!/bin/sh

# http://blog.csdn.net/w1242245/article/details/20843819
# 先确定需要的module系统是否安装及其位置。
locate libpk-gtk-module.so 
locate libcanberra-gtk-module.so 

echo 'echo "/usr/lib64/gtk-2.0/modules/"> /etc/ld.so.conf.d/gtk-2.0.conf'
echo "/usr/lib64/gtk-2.0/modules/"> /etc/ld.so.conf.d/gtk-2.0.conf

ldconfig

updatedb
