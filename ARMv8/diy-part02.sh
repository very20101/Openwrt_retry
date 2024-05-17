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

# Patch kernel to fix fullcone conflict
pushd target/linux/generic/hack-5.15
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/generic/hack-5.15/952-add-net-conntrack-events-support-multiple-registrant.patch
popd
wget -P target/linux/generic/hack-5.10 https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/generic/hack-5.15/952-net-conntrack-events-support-multiple-registrant.patch

## Add deps
#git clone -b master --single-branch https://github.com/LGA1150/openwrt-fullconenat package/fullconenat
merge_package https://github.com/kenzok8/small-package/luci-app-dnscrypt-proxy2 package/luci-app-dnscrypt-proxy2

# themes
git clone https://github.com/rosywrt/luci-theme-rosy/tree/openwrt-18.06/luci-theme-rosy.git package/luci-theme-rosy
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git package/luci-theme-infinityfreedom
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd

## Add extra package
#git clone https://github.com/kenzok8/openwrt-packages package/openwrt-packages
#git clone https://github.com/kenzok8/small package/small
#rm -rf package/small/shadowsocks-rust
#merge_package https://github.com/xiaorouji/openwrt-passwall-packages/shadowsocks-rust package/small/shadowsocks-rust
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default

## Add deps(from other source)
merge_package https://github.com/coolsnowwolf/lede/trunk/package/lean/libcryptopp package/libcryptopp

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
rm -rf package/op-retry
  

./scripts/feeds update -a
./scripts/feeds install -a

echo "DIY2 配置结束……"
echo "========================="
