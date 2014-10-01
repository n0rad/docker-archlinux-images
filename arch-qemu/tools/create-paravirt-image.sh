#!/bin/bash -x
(( EUID != 0 )) && echo 'This script must be run as root.' && exit 1
hash pacstrap &>/dev/null || {
	echo "Could not find pacstrap. Run pacman -S arch-install-scripts"
	exit 1
}
trap 'umount "$TARGET/mnt"; exit' ERR




DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TARGET="./new-vm"
rm -Rf "$TARGET"
mkdir "$TARGET"

dd if=/dev/zero of="$TARGET/docker.img" bs=1M count=3000
dd if=/dev/zero of="$TARGET/docker.swap" bs=1M count=1000

mkfs.ext4 -F "$TARGET/docker.img"
mkswap "$TARGET/docker.swap"

mkdir "$TARGET/mnt"
mount -o loop "$TARGET/docker.img" "$TARGET/mnt"

pacstrap -C "$DIR/../../arch/mkimage-arch-pacman.conf" -c -G -M -d "$TARGET/mnt" base

umount "$TARGET/mnt"
