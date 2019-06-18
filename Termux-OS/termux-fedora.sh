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

folder=fedora-ports
if [ -d "$folder" ]; then
        first=1
        echo "跳过已经下载"
fi
tarball="fedora.tar.xz"
if [ "$first" != 1 ];then
        if [ ! -f $tarball ]; then
                echo "正在下载fedore"
                case `dpkg --print-architecture` in
                aarch64)
                        archurl="arm64" ;;
                *)
                        echo "unknown architecture"; exit 1 ;;
                esac
                wget "https://download.fedoraproject.org/pub/fedora/linux/releases/30/Container/aarch64/images/Fedora-Container-Base-30-1.2.aarch64.tar.xz" -O $tarball
        fi
        cur=`pwd`
        mkdir -p "$folder"
        cd "$folder"
        echo "正在解压fedore镜像"
        proot --link2symlink tar -xf ${cur}/${tarball} --exclude='dev'||:
        echo "正在修复系统网络"
        echo "nameserver 8.8.8.8" > etc/resolv.conf
        cd "$cur"
fi
mkdir -p binds
bin=start-fedore.sh
echo "编写脚本"
cat > $bin <<- EOM
#!/bin/bash
cd \$(dirname \$0)
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD && proot --link2symlink -0 -r ~/fedora-ports -b /dev/ -b /sys/ -b /proc/ -b /storage/ -b $HOME -w $HOME /bin/env -i HOME=/root TERM="$TERM" PS1='[termux@fedora \W]\$ ' LANG=$LANG PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash --login
EOM

echo "正在安装工作中 $bin"
termux-fix-shebang $bin
echo "正在进行中 $bin executable"
chmod +x $bin

echo  “全部完成！以"./${bin}"脚本启动fedore。获得定期'dnf update && dnf upgrade'的更新。”
