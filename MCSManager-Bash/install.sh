#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin


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
        echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list
	echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
	apt-get update
	apt-get install oracle-java8-installer -y
	apt-get install git git-core curl build-essential openssl libssl-dev wget -y
	curl -sL https://deb.nodesource.com/setup_9.x -o nodesource_setup.sh
        bash nodesource_setup.sh
	apt-get install nodejs -y	
fi
if [[ ${OS} == CentOS ]];then
	yum install update
	yum install -y gcc-c++ make clur java git wget
	curl -sL https://rpm.nodesource.com/setup_9.x | sudo -E bash -
	yum install nodejs -y
fi
if [[ ${OS} == Debian ]];then
        echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list
	echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
	apt-get update
	apt-get install oracle-java8-installer -y
	apt-get install git git-core curl build-essential openssl libssl-dev wget -y
	curl -sL https://deb.nodesource.com/setup_9.x -o nodesource_setup.sh
        bash nodesource_setup.sh
	apt-get install nodejs -y	
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
wget https://raw.githubusercontent.com/Fcatme/MCSManager-Bash/master/Mc
chmod +x Mc

#INstall Success
echo 'MCSManager-Bash v0.1'
echo 'F喵博客地址:https://Fcat.me'
echo '输入 ~/Mc 选择启动方式'
echo '安装完成！访问地址:http://IP:23333/'
echo '初始账号:#master 密码:123456 '
echo 'QQ Group:287215485'
