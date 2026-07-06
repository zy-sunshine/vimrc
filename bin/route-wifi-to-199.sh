#!/bin/bash

GATEWAY="192.168.1.199"
DNS_IP="30.30.30.30"
MIHOMO_NET="198.18.0.0/16"
IFACE="Wi-Fi"

# 先清理旧路由（静默报错不弹窗）
sudo route delete default $GATEWAY 2>/dev/null
sudo route delete -net $MIHOMO_NET $GATEWAY 2>/dev/null
sudo route delete -net $DNS_IP/32 $GATEWAY 2>/dev/null

if [ "$1" == "delete" ]; then
    exit 0
fi

# 严格顺序：先静态路由，再默认网关
sudo route add -net $MIHOMO_NET $GATEWAY
#sudo route add -net $DNS_IP/32 $GATEWAY
sudo route add default $GATEWAY

# 锁定DNS，防止DHCP篡改DNS
sudo networksetup -setdnsservers $IFACE $DNS_IP 223.5.5.5
sudo networksetup -setv6off $IFACE

echo "路由与DNS已自动恢复完成: $GATEWAY"

# 需要先清空默认路由
#sudo route delete 198.18.0.0/16 192.168.1.199
#sudo route delete default
# 必须先给关键网段加路由
#sudo route add 198.18.0.0/16 192.168.1.199
# 然后加默认路由
#sudo route add default 192.168.1.199
#sudo networksetup -setdnsservers "Wi-Fi" 30.30.30.30 223.5.5.5
#sudo networksetup -setv6off "Wi-Fi"
#sudo route delete default 30.75.160.1
#sudo route -n flush
#sudo arp -a -d
#sudo dscacheutil -flushcache
#sudo killall -HUP mDNSResponder
#sudo ifconfig en0 down
#sudo ifconfig en0 up
