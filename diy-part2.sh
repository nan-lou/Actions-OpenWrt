#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/10.10.10.6/g' package/base-files/files/bin/config_generate



 
#'删除argon主题，并拉最新版'
rm -rf package/lean/luci-theme-argon
#git clone https://github.com/jerrykuku/luci-theme-argon -b 19.07_stable package/lean/luci-theme-argon
git clone -b master https://github.com/jerrykuku/luci-theme-argon package/lean/luci-theme-argon

#'设置默认主题'
default_theme='argon'
sed -i "s/bootstrap/$default_theme/g" feeds/luci/modules/luci-base/root/etc/config/luci
