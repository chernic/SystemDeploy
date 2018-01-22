#!/bin/bash

##
# @file check_linux_ver.sh
# @copyright 版权所有 (C) 广州市聚星源科技有限公司
# @brief 识别不同的linux操作系统
#
# 修订记录 
# @author   张泽钊
# @version  1.00
# @date 2015-11-06
# @brief 目前只支持RHEL5,RHEL6
#
# @author   张泽钊
# @version  1.01
# @date 2016-03-05
# @brief 改IsSubStr为isStrStr，改返回值为成功返回0，失败返回1。
#
##

IS_DONE_CHECK_LINUX_VER=true;

function isStrStr()
{
  local f=`echo "$1" | grep "$2"`
  if [ "$f" = "" ]; then return 1; fi
  return 0
}

g_bIsRHEL5=false
g_bIsRHEL6=false

function IsRHEL5()
{
  if !($g_bIsRHEL5) then
    #local desc=`lsb_release -d 2>&1`
    #if ! isStrStr "${desc}" "Red Hat Enterprise Linux Server"; then
    #    local desc=`cat /etc/issue`
    #fi
    local desc=`cat /etc/issue`
    #echo "${desc}"

    local flag="Red Hat Enterprise Linux Server release 5"

    if isStrStr "${desc}" "${flag}"; then
      g_bIsRHEL5=true
    else
      #CentOS5也当作RHEL5
      local flag="CentOS release 5"
      if isStrStr "${desc}" "${flag}"; then
          g_bIsRHEL5=true
      else
          g_bIsRHEL5=false
      fi
    fi
  fi

  if ($g_bIsRHEL5) then
    return 1
  fi

  return 0
}

function IsRHEL6()
{
  if !($g_bIsRHEL6) then
    #local desc=`lsb_release -d 2>&1`
    #if ! isStrStr "${desc}" "Red Hat Enterprise Linux Server"; then
    #    local desc=`cat /etc/issue`
    #fi
    local desc=`cat /etc/issue`
    #echo "${desc}"
    local flag="Red Hat Enterprise Linux Server release 6"
    if isStrStr "${desc}" "${flag}"; then
      g_bIsRHEL6=true
    else
      #CentOS6也当作RHEL6
      local flag="CentOS release 6"
      if isStrStr "${desc}" "${flag}"; then
          g_bIsRHEL6=true
      else
          g_bIsRHEL6=false
      fi
    fi
  fi

  if ($g_bIsRHEL6) then
    return 1
  fi

  return 0
}

IsRHEL5
#echo $?

if ($g_bIsRHEL5) then
    echo "It is rhel5"
fi

IsRHEL6
#echo $?

if ($g_bIsRHEL6) then
    echo "It is               rhel6"
fi

#得到系统字长
if [ -z $SYS_BIT ]; then
    SYS_BIT=$(getconf LONG_BIT);
    echo "system bits       : ${SYS_BIT}"
fi

if [ -z $atm_sys_flag ] ; then
  if $g_bIsRHEL5; then
    atm_32bit_sys_flag="rhel5.i386"
    atm_64bit_sys_flag="rhel5.x86_64"
  elif $g_bIsRHEL6; then
    atm_32bit_sys_flag="el6.i686"
    atm_64bit_sys_flag="el6.x86_64"
  else
    LOG_ERROR "Unsupport this system!";
    exit 1
  fi
  
  if [ "32" = ${SYS_BIT} ]; then 
    #32
    atm_sys_flag=${atm_32bit_sys_flag}
  elif [ "64" = ${SYS_BIT} ]; then 
    #64
    atm_sys_flag=${atm_64bit_sys_flag}
  else
    LOG_ERROR "Unsupport this system!";
    exit 1
  fi
  
  echo "atm_sys_flag:${atm_sys_flag}"
fi
