#!/bin/sh

yum install samba

smbclient -L //192.168.1.101 -Ufocustar
# Enter focustar's password: 
# session setup failed: NT_STATUS_LOGON_FAILURE


groupadd focustar


useradd focustar -g focustar
# useradd��focustar ���Ѿ����� - ������뽫���û����뵽���飬��ʹ�� -g ������


pdbedit -a -u focustar
