#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# https://github.com/haiibo/openwrt
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
echo  'src-git small8 https://github.com/kenzok8/small-package' >>feeds.conf.default

#sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default



# themes
#git clone https://github.com/rosywrt/luci-theme-rosy/tree/openwrt-18.06/luci-theme-rosy.git package/luci-theme-rosy
#git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git package/luci-theme-infinityfreedom
#git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
#git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
