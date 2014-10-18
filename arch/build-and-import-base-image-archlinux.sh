#!/bin/bash -x
(( EUID != 0 )) && echo 'This script must be run as root.' && exit 1
hash pacstrap &>/dev/null || {
	echo "Could not find pacstrap. Run pacman -S arch-install-scripts"
	exit 1
}

hash rngd &>/dev/null || {
        echo "Could not find pacstrap. Run pacman -S rng-tools"
        exit 1
}

trap 'rm -rf $buildfolder; exit' ERR




DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
buildfolder=/tmp/docker-base-archlinux-$RANDOM
mkdir -p "$buildfolder"

pacstrap -C "$DIR/mkimage-arch-pacman.conf" -c -G -M -d "$buildfolder" \
	bash bzip2 coreutils file filesystem findutils gawk gcc-libs gettext glibc \
	grep gzip inetutils iputils iproute2 less pacman perl procps-ng psmisc sed \
	shadow tar texinfo util-linux which supervisor net-tools nano vi

# clear packages cache
rm -f "$buildfolder/var/cache/pacman/pkg/"*
rm -f "$buildfolder/var/log/pacman.log"

# create working dev
mknod -m 666 "$buildfolder/dev"/null c 1 3
mknod -m 666 "$buildfolder/dev"/zero c 1 5
mknod -m 666 "$buildfolder/dev"/random c 1 8
mknod -m 666 "$buildfolder/dev"/urandom c 1 9
mkdir -m 755 "$buildfolder/dev"/pts
mkdir -m 1777 "$buildfolder/dev"/shm
mknod -m 666 "$buildfolder/dev"/tty c 5 0
mknod -m 600 "$buildfolder/dev"/console c 5 1
mknod -m 666 "$buildfolder/dev"/tty0 c 4 0
mknod -m 666 "$buildfolder/dev"/full c 1 7
mknod -m 600 "$buildfolder/dev"/initctl p
mknod -m 666 "$buildfolder/dev"/ptmx c 5 2

# link pacman log to /dev/null
arch-chroot "$buildfolder" ln -s /dev/null /var/log/pacman.log

# update supervisord config
sed -e "s,nodaemon=false,nodaemon=true ," -i "$buildfolder/etc/supervisord.conf"

# backup required locale stuff
mkdir store-locale
cp -a "$buildfolder/usr/share/locale/"{locale.alias,en_US} store-locale

# cleanup locale and manpage stuff, not needed to run in container
toClean=('usr/share/locale' 'usr/share/man')
noExtract=''
for clean in ${toClean[@]}; do
	rm -rf "$buildfolder/$clean"/*
	noExtract="$noExtract $clean/*"
done
sed -e "s,^#NoExtract.*,NoExtract = $noExtract," \
	-i "$buildfolder/etc/pacman.conf"

# restore required locale stuff
cp -a store-locale/* "$buildfolder/usr/share/locale/"
rm -rf store-locale

# generate locales for en_US
sed -e 's/#en_US/en_US/g' -i "$buildfolder/etc/locale.gen"
arch-chroot "$buildfolder" locale-gen

# set default mirror
echo 'Server = http://mirrors.kernel.org/archlinux/$repo/os/$arch' >\
	"$buildfolder/etc/pacman.d/mirrorlist"

rngd -r /dev/urandom
arch-chroot "$buildfolder" \
	/bin/sh -c 'pacman-key --init; \
		pacman-key --populate archlinux'
killall -9 rngd

# yaourt
arch-chroot "$buildfolder" /bin/bash -x <<'EOF'
pacman -Sy --noconfirm base-devel yajl
cd "$buildfolder/tmp"
curl -O https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
tar zxvf package-query.tar.gz
cd package-query
makepkg -si --asroot --noconfirm
cd ..
curl -O https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
tar zxvf yaourt.tar.gz
cd yaourt
makepkg -si --asroot --noconfirm
cd ..
rm -rf "$buildfolder/tmp/*"
EOF

tar --numeric-owner -C "$buildfolder" -c . | docker import - n0rad/arch

rm -rf "$buildfolder"
