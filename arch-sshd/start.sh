#!/bin/sh -x

useradd -u $2 $1
sed -e "s/$1:!:/$1:NP:/g" -i /etc/shadow
/usr/sbin/sshd -D -e

