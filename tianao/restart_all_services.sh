#!/bin/sh
service iptables stop

 service httpd restart 
 service mysql restart
 service focus_rs_main restart 
 service focusmain restart 

