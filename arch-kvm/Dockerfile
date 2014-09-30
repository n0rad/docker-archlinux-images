# kvm
FROM n0rad/arch
MAINTAINER n0rad <alemaire@norad.fr>

RUN pacman -Sy --noconfirm libvirt qemu && pacman -Scc --noconfirm
RUN mkdir -p /srv/vm /var/run/dbus

ADD ./kvm-start.sh /opt/kvm-start.sh
ADD ./kvm.ini /etc/supervisor.d/kvm.ini
EXPOSE 5900
VOLUME ["/var/log/supervisor", "/var/vm", "/lib/modules"]
CMD ["/usr/bin/supervisord"]
