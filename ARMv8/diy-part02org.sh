#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# https://github.com/breakings/openwrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# kernel
 #sed -i 's/KERNEL_PATCHVER:=6.6/KERNEL_PATCHVER:=6.1/g' target/linux/armsr/Makefile

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo  'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
#echo  'src-git small https://github.com/kenzok8/small' >>feeds.conf.default
#echo 'src-git packages https://github.com/openwrt/packages.git' >>feeds.conf.default
#echo 'src-git luci https://github.com/openwrt/luci.git' >>feeds.conf.default
#echo 'src-git routing https://git.openwrt.org/feed/routing.git' >>feeds.conf.default
#echo 'src-git telephony https://git.openwrt.org/feed/telephony.git' >>feeds.conf.default
#git clone https://github.com/kenzok8/small-package package/smpackage
#git clone  https://github.com/kenzok8/openwrt-packages.git packages/kenzo
#git clone  https://github.com/kenzok8/small.git packages/small

## Add deps
git clone -b master --single-branch https://github.com/LGA1150/openwrt-fullconenat packages/fullconenat
#merge_package https://github.com/kenzok8/small-package/luci-app-dnscrypt-proxy2 package/luci-app-dnscrypt-proxy2

# themes
git clone https://github.com/rosywrt/luci-theme-rosy/tree/openwrt-18.06/luci-theme-rosy.git packages/luci-theme-rosy
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git package/sluci-theme-infinityfreedom
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git packages/luci-theme-opentomcat
git clone https://github.com/sirpdboy/luci-theme-opentopd.git packages/luci-theme-opentopd

## Add extra package
#git clone https://github.com/kenzok8/openwrt-packages packages/openwrt-packages
#git clone https://github.com/kenzok8/small packages/small
#rm -rf package/small/shadowsocks-rust
#merge_package https://github.com/xiaorouji/openwrt-passwall-packages/shadowsocks-rust package/small/shadowsocks-rust
#sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
#sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default

## Add deps(from other source)
#merge_package https://github.com/coolsnowwolf/lede/package/lean/libcryptopp package/libcryptopp

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.200/g' package/base-files/files/bin/config_generate
  
# kernel
#sed -i "s/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g" target/linux/armvirt/Makefile
#sed -i "s/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.15/g" target/linux/armvirt/Makefile

## replace libs for shadowsocks-libev error
#rm -rf package/libs/mbedtls  package/libs/ustream-ssl package/libs/uclient
# git clone -b main https://github.com/very20101/openwrt_retry packages/op-retry
#mv packages/op-retry/libs/mbedtls package/libs/mbedtls
#mv packages/op-retry/libs/ustream-ssl package/libs/ustream-ssl
#mv packagse/op-retry/libs/uclient package/libs/uclient

## luci-app-ssr-plus
#rm -rf packages/smpackage/luci-app-ssr-plus
# mv cp -rf packages/op-retry/pkg_modified/luci-app-ssr-plus packages/smpackage/luci-app-ssr-plus

## curl
#rm -rf feeds/packages/net/curl
#mv packages/op-retry/pkg_modified/curl feeds/packages/net/curl

## luci-app-dnscrypt-proxy2
# cp -rf packages/op-retry/pkg_modified/luci-app-dnscrypt-proxy2 packages/luci-app-dnscrypt-proxy2

## ruby 
#rm -rf feeds/packages/lang/ruby
# cp -rf packages/op-retry/pkg_modified/ruby feeds/packages/lang/ruby


# rm -rf packages/op-retry

# replace golang
#rm -rf feeds/packages/lang/golang
#git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
  

./scripts/feeds update -a
./scripts/feeds install -f
