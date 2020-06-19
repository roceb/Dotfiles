#! /bin/sh

killall -q openvpn
while pgrep -x openvpn >/dev/null; do sleep 1;done

openvpn --auth-nocache --daemon --cd "/etc/openvpn/conf.d" --config "USEast.ovpn"
