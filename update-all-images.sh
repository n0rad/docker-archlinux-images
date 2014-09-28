#!/bin/bash -x
# simple script to update all images

echo "Required root password to bootstrap archlinux base image :"
sudo arch/build-and-import-base-image-archlinux.sh

IMGS="
arch-nginx
arch-nginx-php
arch-nginx-php-mysql
"

for img in $IMGS ; do
  cd $img
  echo "updating $img"
  echo -e "\e[101mupdating $img :\e[0;m"
  docker build -t n0rad/$img .
  cd -
done
