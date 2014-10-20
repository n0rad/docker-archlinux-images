#!/bin/bash -x

qemu-system-x86_64 \
  -boot order=d \
  -name vm \
  -m 1024 \
  -machine pc-i440fx-2.1,accel=kvm,usb=off \
  -smp 1,sockets=1,cores=1,threads=1 \
  -realtime mlock=off \
  -rtc base=utc \
  -vga std \
  -nographic \
  -vnc 0.0.0.0:0 \
  -k fr \
  -device piix3-usb-uhci,id=usb,bus=pci.0,addr=0x1.0x2 \
  -device usb-tablet,id=input0 \
  -drive file=/srv/vm/vm.img,if=virtio,format=raw,cache=none,aio=native \
  -drive file=/srv/vm/vm.swap,if=virtio,format=raw,cache=none,aio=native \
  -cdrom /srv/vm/ubuntu.iso \
  -net nic,model=virtio \

