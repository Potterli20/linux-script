#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
export PATH

#=================================================
#	System Required: CentOS 6/7,Debian 8/9,Ubuntu 16+
#	Description: MC服务器管理
#	Version: 1.0.1
#	update:bug repair
#=================================================

sh_ver="1.0.1"
github="raw.githubusercontent.com/Potterli20/linux-script/master/MCSManager-Bash"

#更新脚本
Update_Shell(){
	echo -e "当前版本为 [ ${sh_ver} ]，开始检测最新版本..."
	sh_new_ver=$(wget --no-check-certificate -qO- "http://${github}/install.sh"|grep 'sh_ver="'|awk -F "=" '{print $NF}'|sed 's/\"//g'|head -1)
	[[ -z ${sh_new_ver} ]] && echo -e "${Error} 检测最新版本失败 !" && start_menu
	if [[ ${sh_new_ver} != ${sh_ver} ]]; then
		echo -e "发现新版本[ ${sh_new_ver} ]，是否更新？[Y/n]"
		read -p "(默认: y):" yn
		[[ -z "${yn}" ]] && yn="y"
		if [[ ${yn} == [Yy] ]]; then
			wget -N --no-check-certificate http://${github}/install.sh && chmod +x install .sh
			echo -e "脚本已更新为最新版本[ ${sh_new_ver} ] !"
		else
			echo && echo "	已取消..." && echo
		fi
	else
		echo -e "当前已是最新版本[ ${sh_new_ver} ] !"
		sleep 5s
	fi
}

#开始菜单
start_menu(){
clear
echo && echo -e " MC服务器管理 ${Red_font_prefix}[v${sh_ver}]${Font_color_suffix}
  -- 就是爱生活 | MC服务器管理 --
  
 ${Green_font_prefix}0.${Font_color_suffix} 升级脚本
 ${Green_font_prefix}1.${Font_color_suffix} 退出脚本
————————————————————————————————" && echo

echo
read -p " 请输入数字 [0-1]:" num
case "$num" in
	0)
	Update_Shell
   	;;
	1)
	exit 1
	;;
	*)
	clear
	echo -e "${Error}:请输入正确数字 [0-1]"
	sleep 5s
	start_menu
	;;
esac
}

#Check Root
[ $(id -u) != "0" ] && { echo "Error: You must be root to run this script"; exit 1; }
#Check OS
if [ -n "$(grep 'Aliyun Linux release' /etc/issue)" -o -e /etc/redhat-release ];then
    OS=CentOS
    [ -n "$(grep ' 7\.' /etc/redhat-release)" ] && CentOS_RHEL_version=7
    [ -n "$(grep ' 6\.' /etc/redhat-release)" -o -n "$(grep 'Aliyun Linux release6 15' /etc/issue)" ] && CentOS_RHEL_version=6
    [ -n "$(grep ' 5\.' /etc/redhat-release)" -o -n "$(grep 'Aliyun Linux release5' /etc/issue)" ] && CentOS_RHEL_version=5
elif [ -n "$(grep 'Amazon Linux AMI release' /etc/issue)" -o -e /etc/system-release ];then
    OS=CentOS
    CentOS_RHEL_version=6
elif [ -n "$(grep bian /etc/issue)" -o "$(lsb_release -is 2>/dev/null)" == 'Debian' ];then
    OS=Debian
    [ ! -e "$(which lsb_release)" ] && { apt-get -y update; apt-get -y install lsb-release; clear; }
    Debian_version=$(lsb_release -sr | awk -F. '{print $1}')
elif [ -n "$(grep Deepin /etc/issue)" -o "$(lsb_release -is 2>/dev/null)" == 'Deepin' ];then
    OS=Debian
    [ ! -e "$(which lsb_release)" ] && { apt-get -y update; apt-get -y install lsb-release; clear; }
    Debian_version=$(lsb_release -sr | awk -F. '{print $1}')
elif [ -n "$(grep Ubuntu /etc/issue)" -o "$(lsb_release -is 2>/dev/null)" == 'Ubuntu' -o -n "$(grep 'Linux Mint' /etc/issue)" ];then
    OS=Ubuntu
    [ ! -e "$(which lsb_release)" ] && { apt-get -y update; apt-get -y install lsb-release; clear; }
    Ubuntu_version=$(lsb_release -sr | awk -F. '{print $1}')
    [ -n "$(grep 'Linux Mint 18' /etc/issue)" ] && Ubuntu_version=16
else
    echo "Does not support this OS, Please contact the author! "
    kill -9 $$
fi


#Get Current Directory
workdir=$(pwd)

#Install Basic Tools
if [[ ${OS} == Ubuntu ]];then
        	sudo add-apt-repository ppa:webupd8team/java
	apt-get update
	apt-get install oracle-java8-installer default-jdk -y
	apt install software-properties-common dirmngr -y
	apt-get install git git-core curl build-essential openssl libssl-dev wget -y
	git clone https://github.com/nodejs/node.git
    	chmod -R 755 node
        	cd node
	./configure
	make && make install	
fi
if [[ ${OS} == CentOS ]];then
	yum install update
	yum install -y gcc-c++ make clur java git wget
	git clone https://github.com/nodejs/node.git
    	chmod -R 755 node
        	cd node
	./configure
	make && make install
fi
if [[ ${OS} == Debian ]];then
	add-apt-repository ppa:webupd8team/java
	apt-get update
	apt-get install oracle-java8-installer default-jdk -y
	apt install software-properties-common dirmngr -y
	apt-get install git git-core curl build-essential openssl libssl-dev wget -y
	git clone https://github.com/nodejs/node.git
    	chmod -R 755 node
        	cd node
	./configure
	make && make install	
fi

#Install MCSManager and MCSManager-Bash
cd /home
git clone https://github.com/Suwings/MCSManager.git
cd /home/MCSManager
npm install --production

#Change CentOS7 Firewall
if [[ ${OS} == CentOS && $CentOS_RHEL_version == 7 ]];then
    systemctl stop firewalld.service
    systemctl disable firewalld.service
fi

#Install MCSManager-Bash
cd
wget https://raw.githubusercontent.com//Potterli20/linux-script/master/MCSManager-Bash/mc
chmod +x mc

#INstall Success

echo '输入 ~/Mc 选择启动方式'
echo '安装完成！访问地址:http://IP:23333/'
echo '初始账号:#master 密码:123456 '

