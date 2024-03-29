#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
# Code from https://github.com/haiibo/OpenWrt
#===============================================

# 修改默认IP
sed -i 's/192.168.1.1/192.168.1.100/g' package/base-files/files/bin/config_generate

# Change default shell to zsh
# sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# 移除重复软件包
rm -rf feeds/packages/net/mosdns
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-netgear
rm -rf feeds/luci/applications/luci-app-netdata
rm -rf feeds/luci/applications/luci-app-wrtbwmon
rm -rf feeds/luci/applications/luci-app-dockerman
rm -rf feeds/packages/net/smartdns

# 添加额外软件包
git clone --depth 1 https://github.com/kongfl888/luci-app-adguardhome package/luci-app-adguardhome
git clone --depth 1 https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan
git clone --depth 1 https://github.com/iwrt/luci-app-ikoolproxy package/luci-app-ikoolproxy
git clone --depth 1 https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff
git clone --depth 1 https://github.com/destan19/OpenAppFilter package/OpenAppFilter
git clone --depth 1 https://github.com/Jason6111/luci-app-netdata package/luci-app-netdata
#git clone --depth 1 -b lede https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-filebrowser package/luci-app-filebrowser
svn export https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman package/luci-app-dockerman
svn export https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-eqos package/luci-app-eqos
svn export https://github.com/coolsnowwolf/packages/trunk/net/n2n package/n2n

# SmartDNS
git clone --depth=1 -b lede https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns
git clone --depth=1 https://github.com/pymumu/openwrt-smartdns package/smartdns

# 科学上网插件
git clone --depth 1 https://github.com/jerrykuku/luci-app-vssr package/luci-app-vssr
git clone --depth 1 https://github.com/jerrykuku/lua-maxminddb package/lua-maxminddb
#svn export https://github.com/kiddin9/openwrt-bypass/trunk/luci-app-bypass package/luci-app-bypass
svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
svn export https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall package/luci-app-passwall
svn export https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 package/luci-app-passwall2
svn export https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/luci-app-ssr-plus

# 科学上网插件依赖
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/brook package/brook
#svn export https://github.com/kenzok8/small-package/trunk/brook package/brook
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/chinadns-ng
#svn export https://github.com/kenzok8/small-package/trunk/chinadns-ng package/chinadns-ng
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/dns2socks package/dns2socks
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/dns2tcp package/dns2tcp
#svn export https://github.com/kenzok8/small-package/trunk/dns2tcp package/dns2tcp
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/hysteria package/hysteria
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/ipt2socks package/ipt2socks
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/microsocks package/microsocks
#svn export https://github.com/kenzok8/small-package/trunk/naiveproxy package/naiveproxy
#svn export https://github.com/kenzok8/small-package/trunk/gn package/gn
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/gn package/gn
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/naiveproxy package/naiveproxy
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/pdnsd-alt package/pdnsd-alt
#svn export https://github.com/xiaorouji/openwrt-passwall/trunk/sagernet-core package/sagernet-core
svn export https://github.com/kenzok8/small-package/trunk/sagernet-core package/sagernet-core
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/ssocks package/ssocks
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/tcping package/tcping
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/trojan-go
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus package/trojan-plus
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray-geodata package/v2ray-geodata
#svn export https://github.com/kenzok8/small-package/trunk/v2ray-geodata package/v2ray-geodata
svn export https://github.com/fw876/helloworld/trunk/simple-obfs package/simple-obfs
svn export https://github.com/fw876/helloworld/trunk/v2ray-core package/v2ray-core
svn export https://github.com/fw876/helloworld/trunk/v2ray-plugin package/v2ray-plugin
svn export https://github.com/fw876/helloworld/trunk/shadowsocks-rust package/shadowsocks-rust
svn export https://github.com/fw876/helloworld/trunk/shadowsocksr-libev package/shadowsocksr-libev
svn export https://github.com/fw876/helloworld/trunk/xray-core package/xray-core
svn export https://github.com/fw876/helloworld/trunk/xray-plugin package/xray-plugin
svn export https://github.com/fw876/helloworld/trunk/lua-neturl package/lua-neturl
svn export https://github.com/fw876/helloworld/trunk/trojan package/trojan
svn export https://github.com/fw876/helloworld/trunk/redsocks2 package/redsocks2

# Themes
git clone --depth 1 -b 18.06 https://github.com/kiddin9/luci-theme-edge package/luci-theme-edge
git clone --depth 1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
git clone --depth 1 https://github.com/thinktip/luci-theme-neobird package/luci-theme-neobird
git clone --depth 1 https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
svn export https://github.com/rosywrt/luci-theme-rosy/trunk/luci-theme-rosy package/luci-theme-rosy
svn export https://github.com/haiibo/packages/trunk/luci-theme-atmaterial package/luci-theme-atmaterial
svn export https://github.com/haiibo/packages/trunk/luci-theme-opentomcat package/luci-theme-opentomcat
svn export https://github.com/haiibo/packages/trunk/luci-theme-netgear package/luci-theme-netgear

# 晶晨宝盒
svn export https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
sed -i "s|firmware_repo.*|firmware_repo 'https://github.com/haiibo/OpenWrt'|g" package/luci-app-amlogic/root/etc/config/amlogic
# sed -i "s|kernel_path.*|kernel_path 'https://github.com/ophub/kernel'|g" package/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|ARMv8|ARMv8_PLUS|g" package/luci-app-amlogic/root/etc/config/amlogic

# MosDNS
svn export https://github.com/sbwml/luci-app-mosdns/trunk/luci-app-mosdns package/luci-app-mosdns
svn export https://github.com/sbwml/luci-app-mosdns/trunk/mosdns package/mosdns
svn export https://github.com/sbwml/luci-app-mosdns/trunk/v2dat package/luci-app-mosdns/v2dat

# DDNS.to
svn export https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-ddnsto package/luci-app-ddnsto
svn export https://github.com/linkease/nas-packages/trunk/network/services/ddnsto package/ddnsto

# 流量监控
svn export https://github.com/haiibo/packages/trunk/luci-app-wrtbwmon package/luci-app-wrtbwmon
svn export https://github.com/haiibo/packages/trunk/wrtbwmon package/wrtbwmon

# Alist
svn export https://github.com/sbwml/luci-app-alist/trunk/luci-app-alist package/luci-app-alist
svn export https://github.com/sbwml/luci-app-alist/trunk/alist package/alist

# iStore
svn export https://github.com/linkease/istore-ui/trunk/app-store-ui package/app-store-ui
svn export https://github.com/linkease/istore/trunk/luci package/istore

# 设置向导
svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-wizard package/luci-app-wizard
sed -i 's/"admin"/"admin", "system"/g' package/luci-app-wizard/luasrc/controller/wizard.lua

# 在线用户
svn export https://github.com/haiibo/packages/trunk/luci-app-onliner package/luci-app-onliner
sed -i '/bin\/sh/a\uci set nlbwmon.@nlbwmon[0].refresh_interval=2s' package/lean/default-settings/files/zzz-default-settings
sed -i '/nlbwmon/a\uci commit nlbwmon' package/lean/default-settings/files/zzz-default-settings

# 修改版本为编译日期
date_version=$(date +"%y.%m.%d")
orig_version=$(cat "package/lean/default-settings/files/zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
sed -i "s/${orig_version}/R${date_version} by Haiibo/g" package/lean/default-settings/files/zzz-default-settings

# 调整 x86 型号只显示 CPU 型号
sed -i '/h=${g}.*/d' package/lean/autocore/files/x86/autocore
sed -i 's/(dmesg.*/{a}${b}${c}${d}${e}${f}/g' package/lean/autocore/files/x86/autocore
sed -i 's/echo $h/echo $g/g' package/lean/autocore/files/x86/autocore

# 删除主题强制默认
find package/luci-theme-*/* -type f -name '*luci-theme-*' -print -exec sed -i '/set luci.main.mediaurlbase/d' {} \;


# 修改 Makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\.github\.com/g' {}

# 调整 V2ray服务器 到 VPN 菜单
sed -i 's/services/vpn/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/controller/*.lua
sed -i 's/services/vpn/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/*.lua
sed -i 's/services/vpn/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/view/v2ray_server/*.htm

./scripts/feeds update -a
./scripts/feeds install -a
