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
                wget "https://partner-images.canonical.com/core/eoan/current/ubuntu-eoan-core-cloudimg-${archurl}-root.tar.gz" -O $tarball
        fi
        cur=`pwd`
        mkdir -p "$folder"
        cd "$folder"
        echo "正在解压ubuntu系统中，请稍等..."
        proot --link2symlink tar -xf ${cur}/${tarball} --exclude='dev'||:
        echo "正在修复网络更新"
        echo "nameserver 8.8.8.8" > etc/resolv.conf
        cd "$cur"
fi

# make a shortcut

cat > /data/data/com.termux/files/usr/bin/startubuntu <<- EOM
#!/data/data/com.termux/files/usr/bin/bash
unset LD_PRELOAD && proot --link2symlink -0 -r ~/ubuntu -b /dev/ -b /sys/ -b /proc/ -b /storage/ -b $HOME -w $HOME /bin/env -i HOME=/root TERM="$TERM" PS1='[termux@ubuntu \W]\$ ' LANG=$LANG PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash --login
EOM

chmod +x /data/data/com.termux/files/usr/bin/startubuntu

# all done

echo "全部完成!以“startubumtu”启动ubumtu。获得定期'apt-get update && apt-get upgrade && apt-get diat-upgrade'的更新。 "
