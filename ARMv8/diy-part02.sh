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

echo "开始 DIY2 配置……"
echo "========================="

function merge_package(){
    repo=`echo $1 | rev | cut -d'/' -f 1 | rev`
    pkg=`echo $2 | rev | cut -d'/' -f 1 | rev`
    # find package/ -follow -name $pkg -not -path "package/custom/*" | xargs -rt rm -rf
    git clone --depth=1 --single-branch $1
    mv $2 package/custom/
    rm -rf $repo
}
function drop_package(){
    find package/ -follow -name $1 -not -path "package/custom/*" | xargs -rt rm -rf
}
function merge_feed(){
    if [ ! -d "feed/$1" ]; then
        echo >> feeds.conf.default
        echo "src-git $1 $2" >> feeds.conf.default
    fi
    ./scripts/feeds update $1
    ./scripts/feeds install -a -p $1
}
rm -rf package/custom; mkdir package/custom

## Add deps
git clone -b master --single-branch https://github.com/LGA1150/openwrt-fullconenat package/fullconenat
merge_package https://github.com/kenzok8/small-package package/luci-app-dnscrypt-proxy2

## Add extra package
git clone https://github.com/kenzok8/openwrt-packages package/openwrt-packages
git clone https://github.com/kenzok8/small package/small
rm -rf package/small/shadowsocks-rust
merge_package https://github.com/xiaorouji/openwrt-passwall-packages package/small/shadowsocks-rust

rm -rf feeds/small8/hysteria
merge_package https://github.com/xiaorouji/openwrt-passwall-packages feeds/small8/hysteria
rm -rf feeds/packages/net/dnscrypt-proxy2
merge_package https://github.com/coolsnowwolf/packages/net/dnscrypt-proxy2 feeds/packages/net/dnscrypt-proxy2
rm -rf package/openwrt-packages/adguardhome/patches
rm -rf package/small/shadowsocks-rust
merge_package https://github.com/xiaorouji/openwrt-passwall-packages package/small/shadowsocks-rust

## Add modified config
#rm -rf config/Config-images.in
#wget -cP config https://raw.githubusercontent.com/very20101/Openwrt_retry/main/config/Config-images.in

# Modify default IP
  sed -i 's/192.168.1.1/192.168.1.100/g' package/base-files/files/bin/config_generate
  
# kernel
  #sed -i "s/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g" target/linux/armvirt/Makefile
  # sed -i "s/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.15/g" target/linux/armvirt/Makefile

./scripts/feeds update -a
./scripts/feeds install -a

echo "========================="
echo " DIY2 配置完成……"
  
