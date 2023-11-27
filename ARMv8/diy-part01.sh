#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo  'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
#echo  'src-git small https://github.com/kenzok8/small' >>feeds.conf.default
#echo  'src-git small8 https://github.com/kenzok8/small-package' >>feeds.conf.default

## Add deps
git clone -b master --single-branch https://github.com/LGA1150/openwrt-fullconenat package/fullconenat
svn export https://github.com/kenzok8/small-package/trunk/luci-app-dnscrypt-proxy2 package/luci-app-dnscrypt-proxy2

## Add extra package
git clone https://github.com/kenzok8/openwrt-packages package/openwrt-packages
git clone https://github.com/kenzok8/small package/small
rm -rf package/small/shadowsocks-rust
svn exporthttps://github.com/xiaorouji/openwrt-passwall-packages/trunk/shadowsocks-rust package/small/shadowsocks-rust

## Add modified config
rm -rf config/Config-images.in
wget -cP config https://raw.githubusercontent.com/very20101/Openwrt_retry/main/config/Config-images.in


# themes
git clone https://github.com/rosywrt/luci-theme-rosy/tree/openwrt-18.06/luci-theme-rosy.git package/luci-theme-rosy
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git package/luci-theme-infinityfreedom
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
