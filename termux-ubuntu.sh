#!/data/data/com.termux/files/usr/bin/bash
requirements=""
	if [ ! -e $PREFIX/bin/tar ]; then
		requirements="${requirements} tar"
	fi
	if [ ! -e $PREFIX/bin/proot ]; then
		requirements="${requirements} proot"
	fi
	if [ ! -e $PREFIX/bin/pv ]; then
		requirements="${requirements} pv"
	fi
	if [ ! -e $PREFIX/bin/curl ]; then
		requirements="${requirements} curl"
	fi
	if [ ! -e $PREFIX/bin/grep ]; then
		requirements="${requirements} grep"
	fi
	if [ ! -e $PREFIX/bin/wget ]; then
		requirements="${requirements} wget"
	fi
	
	if [ ! -z "$requirements" ]; then
		pkg install ${requirements} -y
    else
			pkg install libcurl -y
	fi

folder=ubuntu-fs
if [ -d "$folder" ]; then
        first=1
        echo "skipping downloading"
fi
tarball="ubuntu.tar.gz"
if [ "$first" != 1 ];then
        if [ ! -f $tarball ]; then
                echo "downloading ubuntu-image"
                case `dpkg --print-architecture` in
                aarch64)
                        archurl="arm64" ;;
                arm)
                        archurl="armhf" ;;
                amd64)
                        archurl="amd64" ;;
                i*86)
                        archurl="i386" ;;
                x86_64)
                        archurl="amd64" ;;
                *)
                        echo "unknown architecture"; exit 1 ;;
                esac
                wget "https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/eoan/current/eoan-server-cloudimg-${archurl}-root.tar.xz" -O $tarball
        fi
        cur=`pwd`
        mkdir -p "$folder"
        cd "$folder"
        echo "正在解压ubuntu镜像"
        proot --link2symlink tar -xf ${cur}/${tarball} --exclude='dev'||:
        echo "正在修复系统网络"
       echo 
       "
        nameserver 8.8.8.8
        nameserver 8.8.4.4
        " > etc/resolv.conf
        cd "$cur"
fi
mkdir -p binds
bin=start-ubuntu.sh
echo "编写脚本"
cat > $bin <<- EOM
#!/bin/bash
cd \$(dirname \$0)
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r $folder"
if [ -n "\$(ls -A binds)" ]; then
    for f in binds/* ;do
      . \$f
    done
fi
command+=" -b /dev"
command+=" -b /proc"
## uncomment the following line to have access to the home directory of termux
#command+=" -b /data/data/com.termux/files/home:/root"
## uncomment the following line to mount /sdcard directly to /
#command+=" -b /sdcard"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=\$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="\$@"
if [ -z "\$1" ];then
    exec \$command
else
    \$command -c "\$com"
fi
EOM

echo "正在安装工作中 $bin"
termux-fix-shebang $bin
echo "正在进行中 $bin executable"
chmod +x $bin

echo  “全部完成！以"./${bin}"脚本启动ubuntu。获得定期'apt-get update && apt-get upgrade && apt-get diat-upgrade'的更新。”
