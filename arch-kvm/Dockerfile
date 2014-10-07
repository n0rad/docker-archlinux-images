# kvm
FROM n0rad/arch
MAINTAINER n0rad <alemaire@norad.fr>

RUN pacman -S --noconfirm qemu && pacman -Scc --noconfirm

ADD ./kvm-start.sh /opt/kvm-start.sh
ADD ./kvm.ini /etc/supervisor.d/kvm.ini
EXPOSE 5900
VOLUME ["/var/log/supervisor", "/srv/vm"]
CMD ["/usr/bin/supervisord"]
