#!/bin/sh -x

iptables -t nat -A POSTROUTING -j MASQUERADE
/pipework --wait
mount -o loop,ro /opt/tftp/*.iso /mnt
darkhttpd /mnt --no-keepalive &
dnsmasq --no-daemon
