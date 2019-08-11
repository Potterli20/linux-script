# 一个人脚本
## 脚本索引

* [***代理相关***](#代理相关)
  * [ss-go.sh](#ss_gosh)
  * [ssr.sh](#ssrsh)
  * [mtproxy_go.sh](#mtproxy_gosh)
* [***服务器相关***](#服务器相关)
  * [MCSManager-Bash](#MCSManager-Bash)
* [***Termux-OS系统***](#Termux-OS系统)
  * [TermuxArch](#TermuxArch)
  * [TermuxAlpine](#TermuxAlpine)
  * [Nethunter-In-Termux](#Nethunter-In-Termux)

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

## Termux-OS系统

##TermuxArch [github:sdrausty](https://github.com/sdrausty/TermuxArch)

- 脚本说明: TermuxArch安装脚本

#### 下载安装:
``` bash 
wget -N --no-check-certificate https://raw.githubusercontent.com/sdrausty/TermuxArch/master/setupTermuxArch.sh && chmod +x setupTermuxArch.sh && ./setupTermuxArch.sh
```

---

## TermuxAlpine [gihub:Hax4us/TermuxAlpine](https://github.com/Hax4us/TermuxAlpine)

- 脚本说明: TermuxArch安装脚本

#### 下载安装:
``` bash 
wget -N --no-check-certificate https://raw.githubusercontent.com/Hax4us/TermuxAlpine/master/TermuxAlpine.sh && chmod +x TermuxAlpine.sh && ./TermuxAlpine.sh
```

---

## Nethunter-In-Termux [gihub:Hax4us/Nethunter-In-Termux](https://github.com/Hax4us/Nethunter-In-Termux)

- 脚本说明: TermuxArch安装脚本

#### 下载安装:
``` bash 
wget -N --no-check-certificate https://raw.githubusercontent.com/Hax4us/Nethunter-In-Termux/master/kalinethunter && chmod +x kalinethunter && ./kalinethunter
```

---