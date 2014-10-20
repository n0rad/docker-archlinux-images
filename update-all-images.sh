#!/bin/bash -x
# simple script to update all images

trap 'exit' ERR

echo "Required root password to bootstrap archlinux base image :"
sudo arch/build-and-import-base-image-archlinux.sh

for i in $(ls -d */ | sort -r); do
  if [ "$i" != "arch/" ]; then
    cd "$i"
    echo "updating ${i%%/}"
    echo -e "\e[101mupdating ${i%%/} :\e[0;m"
    docker build -t "n0rad/${i%%/}" .
    cd -
  fi
done
