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


## Add deps
git clone -b master --single-branch https://github.com/LGA1150/openwrt-fullconenat package/fullconenat

# Patch kernel to fix fullcone conflict
pushd target/linux/generic/hack-5.15
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/generic/hack-5.15/952-add-net-conntrack-events-support-multiple-registrant.patch
popd
wget -P target/linux/generic/hack-5.10 https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/generic/hack-5.15/952-net-conntrack-events-support-multiple-registrant.patch

## Add deps
#git clone -b master --single-branch https://github.com/LGA1150/openwrt-fullconenat package/fullconenat
#merge_package https://github.com/kenzok8/small-package/luci-app-dnscrypt-proxy2 package/luci-app-dnscrypt-proxy2

# themes
git clone https://github.com/rosywrt/luci-theme-rosy/tree/openwrt-18.06/luci-theme-rosy.git package/luci-theme-rosy
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git package/luci-theme-infinityfreedom
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd

## Add extra package
#sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
#sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
#rm -rf feeds/luci/applications/luci-app-mosdns
#rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
#rm -rf feeds/packages/utils/v2dat

## Add deps(from other source)
#merge_package https://github.com/coolsnowwolf/lede/trunk/package/lean/libcryptopp package/libcryptopp

# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.100/g' package/base-files/files/bin/config_generate
  
# kernel
#sed -i "s/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g" target/linux/armvirt/Makefile
#sed -i "s/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.15/g" target/linux/armvirt/Makefile

## replace libs for shadowsocks-libev error
rm -rf package/libs/mbedtls  package/libs/ustream-ssl package/libs/uclient
git clone -b main https://github.com/very20101/openwrt_retry package/op-retry
mv package/op-retry/libs/mbedtls package/libs/mbedtls
mv package/op-retry/libs/ustream-ssl package/libs/ustream-ssl
mv package/op-retry/libs/uclient package/libs/uclient

## luci-app-dnscrypt-proxy2
mv package/op-retry/pkg_modified/luci-app-dnscrypt-proxy2 package/luci-app-dnscrypt-proxy2

##
rm -rf package/op-retry

# replace golang
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang

./scripts/feeds update -a
./scripts/feeds install -f
