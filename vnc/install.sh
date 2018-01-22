#!/bin/sh

yum install tigervnc tigervnc-server -y

# http://www.linuxidc.com/Linux/2016-06/132024.htm

# 1、下载vncserver
# yum install tigervnc tigervnc-server -y

# 2、配置 vncserver  
# vim  /etc/sysconfig/vncserver
 # 在文件加入下面两行代码：
# VNCSERVERS="2:root"
# VNCSERVERARGS[2]="-geometry 800x600  -nolisten tcp -localhost"

# 3、配置当前用户的vnc登陆密码，连续输入两次即可。这个密码是vnc连接密码，和系统密码没有关系。可以不一样。
# [root@localhost ~]# vncpasswd 
# Password:
# Verify:
# [root@localhost ~]#

# 4、启动vncserver服务。 第一次启动时这样操作  直接输入 vncserver & 
# 系统会自动建立相关的配置文件和日志文件。启动后系统会提示出一个进程号为1的窗口。
# 如果需要启动两个窗口的话则再次执行VNCSERVER 命令即可。
# [root@localhost X11]# vncserver &
# [1] 3002

# 5、在xp客户端使用vncviewer软件 以  “ip:1”的形式连接，输入密码后进入到vncserver中。
