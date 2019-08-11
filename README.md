# 范-海辛脚本收集
## 脚本索引

* [***代理相关***](#代理相关)
  * [ss-go.sh](#ss_gosh)
  * [ssr.sh](#ssrsh)
  * [mtproxy_go.sh](#mtproxy_gosh)
* [***服务器相关***](#服务器相关)
  * [MCSManager-Bash](#MCSManager-Bash)
* [***Termux-OS系统***](#Termux-OS)
  * [Termux-Arch](#Termux-Arch)
  * [Termux-Alpine](#Termux-Alpine)
  * [Nethunter-In-Termux](#Nethunter-In-Termux)
  * [Termux-kail](#Termux-kail)
  * [Termux-Parrot](#Termux-Parrot)
  * [Termux-Backbox](#Termux-Backbox)
  * [Termux-Opensuse-tumbelweed](#Termux-Opensuse-tumbelweed)
  * [Termux-Black-Arch](#Termux-Black-Arch)
  * [Termux-Opensuse-leap](#Termux-Opensuse-leap)
  * [Termux-Ubuntu](#Termux-Ubuntu)
  * [Termux-Debian](#Termux-Debian)
  * [Termux-Fedroa](#Termux-Fedroa)
  * [Termux-Centos](#Termux-Centos)
  * [Termux-OS-Tools](#Termux-OS-Tools)

---

## 代理相关

## ss_go.sh

- 脚本说明: Shadowsocks 一键安装管理脚本
- 系统支持: CentOS6+ / Debian6+ / Ubuntu14+
- 项目地址: https://github.com/shadowsocks/go-shadowsocks2

#### 脚本特点:
目前网上的各个Shadowsocks脚本基本都是只有 安装/启动/重启 等基础功能，对于小白来说还是不够简单方便。既然是一键脚本，那么就要尽可能地简单，小白更容易接受使用！

#### 下载安装:
``` bash
wget -N --no-check-certificate https://raw.githubusercontent.com/Potterli20/linux-script/master/vpn/ss-go.sh && chmod +x ss-go.sh && ./ss-go.sh
```

---

## ssr.sh

- 脚本说明: ShadowsocksR 一键安装管理脚本，支持单端口/多端口切换和管理
- 系统支持: CentOS6+ / Debian6+ / Ubuntu14+

#### 脚本特点:
目前网上的各个ShadowsocksR脚本基本都是只有 安装/启动/重启 等基础功能，对于小白来说还是不够简单方便。既然是一键脚本，那么就要尽可能地简单，小白更容易接受使用！

- 支持 限制 用户速度
- 支持 限制 用户设备数
- 支持 限制 用户总流量
- 支持 定时 流量清零
- 支持 显示 当前连接IP
- 支持 显示 SS/SSR连接
- 支持 一键封禁 垃圾邮件(SMAP)/BT/PT

#### 下载安装:
``` bash
wget -N --no-check-certificate https://raw.githubusercontent.com/Potterli20/linux-script/master/vpn/ssr.sh && chmod +x ssr.sh && ./ssr.sh
```

---
## mtproxy_go.sh

- 脚本说明: Mtproto Proxy Go版 一键安装管理脚本
- 系统支持: CentOS6+ / Debian7+ / Ubuntu14+

#### 下载安装:
``` bash
wget -N --no-check-certificate https://raw.githubusercontent.com/Potterli20/linux-script/master/vpn//mtproxy_go.sh && chmod +x mtproxy_go.sh && bash mtproxy_go.sh
```

---

## 服务器相关

## MCSManager-Bash

- 脚本说明: MC服务器 一键安装管理脚本
- 系统支持: CentOS 6/7,Debian 8/9,Ubuntu 16+

#### 下载安装:
``` bash 
wget -N --no-check-certificate https://raw.githubusercontent.com/Potterli20/linux-script/master/MCSManager-Bash/install.sh && chmod +x install.sh && ./install.sh
```

---

## Termux-OS

## Termux-Arch

- 脚本说明: TermuxArch安装脚本

#### 下载安装:
``` bash 
wget -N --no-check-certificate https://raw.githubusercontent.com/sdrausty/TermuxArch/master/setupTermuxArch.sh && chmod +x setupTermuxArch.sh && ./setupTermuxArch.sh
```

---

## Termux-Alpine

- 脚本说明: TermuxArch安装脚本

#### 下载安装:
``` bash 
wget -N --no-check-certificate https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/Alpine/alpine.sh && chmod +x alpine.sh && ./alpine.sh
```

---

## Nethunter-In-Termux

- 脚本说明: Nethunter-In-Termux安装脚本

#### 下载安装:
``` bash 
wget -N --no-check-certificate https://raw.githubusercontent.com/Hax4us/Nethunter-In-Termux/master/kalinethunter && chmod +x kalinethunter && ./kalinethunter
```

---

## Termux-kail

- 脚本说明: Termux-kail安装脚本

#### 下载安装:
``` bash 
wget -N --no-check-certificate https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/Kali/kali.sh && chmod +x kali.sh && ./kali.sh
```

---

## Termux-Parrot

- 脚本说明: Termux-Parrot安装脚本

#### 下载安装:
``` bash 
wget -N --no-check-certificate https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/Parrot/parrot.sh && chmod +x parrot.sh && ./parrot.sh
```

---

## Termux-Backbox

- 脚本说明: Termux-Backbox安装脚本

#### 下载安装:
``` bash 
wget -N --no-check-certificate https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/Backbox/barrot.sh && chmod +x barrot.sh && ./barrot.sh
```

---

## Termux-Opensuse-tumbelweed

- 脚本说明: Termux-Opensuse-tumbelweed安装脚本

#### 下载安装:
``` bash 
wget -N --no-check-certificate https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/openSUSE/Tumbleweed/opensuse-tumbleweed.sh && chmod +x opensuse-tumbleweed.sh && ./opensuse-tumbleweed.sh
```

---

## Termux-Black-Arch

- 脚本说明: Termux-Black-Arch安装脚本

#### 下载安装:
``` bash 
curl -O https://blackarch.org/strap.sh && chmod +x strap.sh && ./strap.sh
```

---

## Termux-Opensuse-leap

- 脚本说明: Termux-Opensuse-leap安装脚本

#### 下载安装:
``` bash 
wget -N --no-check-certificate https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/openSUSE/Leap/opensuse-leap.sh && chmod +x opensuse-leap.sh && ./opensuse-leap.sh
```

---

## Termux-Ubuntu

- 脚本说明: Termux-Ubuntu安装脚本

#### 下载安装:
``` bash 
wget -N --no-check-certificate https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/Ubuntu/ubuntu.sh && chmod +x ubuntu.sh && ./ubuntu.sh
```

---

## Termux-Debian

- 脚本说明: Termux-Debian安装脚本

#### 下载安装:
``` bash 
wget -N --no-check-certificate https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/Debian/debian.sh && chmod +x debian.sh && ./debian.sh
```

---

## Termux-Fedroa

- 脚本说明: Termux-Fedroa安装脚本

#### 下载安装:
``` bash 
wget -N --no-check-certificate https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/Fedora/fedora.sh && chmod +x fedora.sh && ./fedora.sh
```

---

## Termux-Centos

- 脚本说明: Termux-Debian安装脚本

#### 下载安装:
``` bash 
wget -N --no-check-certificate https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/CentOS/centos.sh && chmod +x centos.sh && ./centos.sh
```

---

## Termux-OS-Tools

- 脚本说明: Termux-OS-Tools安装脚本

#### 脚本特点:
它是一个安装各种操作系统的非常简单的工具。
在termux中使用它

#### 下载安装:
``` bash 
wget -N --no-check-certificate https://raw.githubusercontent.com/Sanif007/tool-OS/master/os.py && apt install python toilet -y  &&  python os.py
```

---