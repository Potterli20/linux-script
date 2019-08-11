#!/bin/sh
# 一键安装onmp
cat << EOF
      ___           ___           ___           ___    
     /  /\         /__/\         /__/\         /  /\   
    /  /::\        \  \:\       |  |::\       /  /::\  
   /  /:/\:\        \  \:\      |  |:|:\     /  /:/\:\ 
  /  /:/  \:\   _____\__\:\   __|__|:|\:\   /  /:/~/:/ 
 /__/:/ \__\:\ /__/::::::::\ /__/::::| \:\ /__/:/ /:/  
 \  \:\ /  /:/ \  \:\~~\~~\/ \  \:\~~\__\/ \  \:\/:/   
  \  \:\  /:/   \  \:\  ~~~   \  \:\        \  \::/    
   \  \:\/:/     \  \:\        \  \:\        \  \:\    
    \  \::/       \  \:\        \  \:\        \  \:\   
     \__\/         \__\/         \__\/         \__\/   

=======================================================

ONMP 是一个 web 环境快速安装脚本，适用于安装了
Entware 的路由器，目前已经在 Padavan、
LEDE（openwrt）、梅林上测试成功。

EOF

Install()
{
	rm -rf /opt/bin/onmp /opt/onmp
	mkdir -p /opt/onmp

    # 获取onmp脚本
    curl -kfsSL https://raw.githubusercontent.com/Potterli20/linux-script/master/onmp/onmp.sh > /opt/onmp/onmp.sh
    chmod +x /opt/onmp/onmp.sh

    # 获取php探针文件
    curl -kfsSL https://raw.githubusercontent.com/WuSiYu/PHP-Probe/master/tz.php > /opt/onmp/tz.php

    /opt/onmp/onmp.sh
}

Updata()
{
	rm -rf /opt/onmp/onmp.sh
	curl -kfsSL https://raw.githubusercontent.com/Potterli20/linux-script/master/onmp/onmp.sh > /opt/onmp/onmp.sh
	chmod +x /opt/onmp/onmp.sh
	/opt/onmp/onmp.sh renewsh > /dev/null 2>&1
	echo "升级完成"
}

start()
{
#
cat << EOF
(1) 开始安装
(2) 升级脚本
EOF

read -p "请输入：" input
case $input in
	1 ) Install;;
2) Updata;;
*) exit;;
esac

}

start