安装和运行说明 By Chernic ( 2016-04-13 )

0) 启动Shell  本目录下运行指令 ./setup.sh
1) 开启所有服务 ./restart_all_services.sh
2) 查看服务状态 ./check_all_status.sh

1. Apache 服务操作:
   [服务开启] service httpd start
   [服务关闭] service httpd stop
   [服务状态] service httpd status
        [root@localhost home]# MySQL running (20315)                 [确定]
        
   [服务重启] service httpd restart

2. MySQL 服务操作:
   [服务开启] service mysql start
   [服务关闭] service mysql stop
   [服务状态] service mysql status
        [root@localhost home]# httpd (pid  XXXXX) 正在运行...
   
   [服务重启] service mysql restart
   
3. focusmain 服务操作:
   [服务开启] service focusmain start
   [服务关闭] service focusmain stop
   [服务状态] service focusmain status
        [root@localhost home]# focusmain (pid XXXX XXX) 正在运行..
        
   [服务重启] service focusmain restart

4. focus_rs_main 服务操作:
   [服务开启] service focus_rs_main start
   [服务关闭] service focus_rs_main stop
   [服务状态] service focus_rs_main status
        [root@localhost home]# start (pid XXXXX) 正在运行...
        
   [服务重启] service focus_rs_main restart
