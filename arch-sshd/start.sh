#!/bin/sh -x

useradd -u $2 $1
sed -e "s/$1:!:/$1:NP:/g" -i /etc/shadow
if [ ! -f /etc/ssh/ssh_host_rsa_key  ]; then
    /usr/bin/ssh-keygen -A
fi
/usr/sbin/sshd -D -e

