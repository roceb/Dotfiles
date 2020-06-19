#!/bin/sh

sudo killall -q openvpn
while pgrep -u $UID -x openvpn >/dev/null; do sleep 1;done
sudo openvpn /home/ross/.vpn/NewYork.ovpn
