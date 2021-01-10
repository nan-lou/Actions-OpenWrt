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



 

# theme: atmaterial
git clone https://github.com/sypopo/luci-theme-atmaterial.git theme-temp/luci-theme-atmaterial
rm -rf theme-temp/luci-theme-atmaterial/LICENSE
rm -rf theme-temp/luci-theme-atmaterial/README.md
rm -rf package/lean/luci-theme-atmaterial
mv -f theme-temp/luci-theme-atmaterial package/lean/
cat >> .config <<EOF
CONFIG_PACKAGE_luci-theme-atmaterial=y
EOF
#rm -rf theme-temp

default_theme='atmaterial'
sed -i "s/bootstrap/$default_theme/g" feeds/luci/modules/luci-base/root/etc/config/luci
