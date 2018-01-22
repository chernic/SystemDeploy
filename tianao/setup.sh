#!/bin/sh
echo ""
# 相对执行路径
__RunnDir=$(dirname $0) && cd ${__RunnDir};
# 绝对执行路径
__HomeDir=$(pwd) && cd ".."
# 执行路径父路径
# __FathDir=$(pwd) && cd $HereDir;
__FathDir=$(pwd) && cd ${__HomeDir};

echo "RunningDir     = $__RunnDir"
echo "HomeDir        = $__HomeDir"
echo "FatherDir      = $__FathDir"
echo ""


if [ -d  $__HomeDir/Apache ]; then
	__ApacheDir="$__HomeDir/Apache"
elif [ -d  $__FathDir/Apache ]; then
	__ApacheDir="$__FathDir/Apache"
else
	echo "DIR(Apache) not Found."
	exit
fi

if [ -d  $__HomeDir/DB ]; then
	__DBDir="$__HomeDir/DB"
elif [ -d  $__FathDir/DB ]; then
	__DBDir="$__FathDir/DB"
else
	echo "DIR(DB) not Found."
	exit
fi

if [ -d  $__HomeDir/FocusMain ]; then
	__FocusMainDir="$__HomeDir/FocusMain"
elif [ -d  $__FathDir/FocusMain ]; then
	__FocusMainDir="$__FathDir/FocusMain"
else
	echo "DIR(FocusMain) not Found."
	exit
fi

if [ -d  $__HomeDir/rtspserver ]; then
	__rtspserverDir="$__HomeDir/rtspserver"
elif [ -d  $__FathDir/rtspserver ]; then
	__rtspserverDir="$__FathDir/rtspserver"
else
	echo "DIR(rtspserver) not Found."
	exit
fi


echo "ApacheDir      = $__ApacheDir"
echo "DBDir          = $__DBDir"
echo "FocusMainDir   = $__FocusMainDir"
echo "rtspserverDir  = $__rtspserverDir"
echo ""

echo "### Apache"
cd "$__ApacheDir"
[ -f install_httpd_for_atm.sh ] && ./install_httpd_for_atm.sh
if [ $? -eq 0 ]; then
    echo -e "\033[32mSuccess\033[0m  in installing Apache"
else
    echo -e "\033[31mFailure\033[0m  in installing Apache"
    exit 1
fi
echo ""

echo "### DB"
cd "$__DBDir"
[ -f install_db_for_atm.sh ] && ./install_db_for_atm.sh
if [ $? -eq 0 ]; then
    echo -e "\033[32mSuccess\033[0m  in installing DB"
else
    echo -e "\033[31mFailure\033[0m  in installing DB"
    exit 1
fi
echo ""

echo "### FocusMain"
cd "$__FocusMainDir"
[ -f install_FocusMain.sh ] && ./install_FocusMain.sh
if [ $? -eq 0 ]; then
    echo -e "\033[32mSuccess\033[0m  in installing FocusMain"
else
    echo -e "\033[31mFailure\033[0m  in installing FocusMain"
    exit 1
fi
echo ""

echo "### rtspserver"
cd "$__rtspserverDir/rtspserver_install"
[ -f install_rtspserver.sh ] && ./install_rtspserver.sh
if [ $? -eq 0 ]; then
    echo -e "\033[32mSuccess\033[0m  in installing rtspserver"
else
    echo -e "\033[31mFailure\033[0m  in installing rtspserver"
    exit 1
fi
echo ""

