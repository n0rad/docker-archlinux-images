# qemu
FROM n0rad/arch
MAINTAINER n0rad <alemaire@norad.fr>

RUN pacman -Sy --noconfirm qemu && pacman -Scc --noconfirm

ADD ./qemu-start.sh /opt/qemu-start.sh
ADD ./qemu.ini /etc/supervisor.d/qemu.ini
EXPOSE 5900
VOLUME ["/var/log/supervisor", "/var/vm"]
CMD ["/usr/bin/supervisord"]
