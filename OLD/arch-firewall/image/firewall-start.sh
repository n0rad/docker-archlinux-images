#!/bin/sh -x

iptables -t nat -A POSTROUTING -j MASQUERADE
/pipework --wait
/pipework --wait -i eth2
