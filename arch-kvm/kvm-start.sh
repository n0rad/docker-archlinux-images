#/bin/bash

dbus-daemon --system
libvirtd
virsh create /srv/vm/vm.xml

