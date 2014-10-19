FROM n0rad/arch
MAINTAINER n0rad <alemaire@norad.fr>

RUN pacman -S --noconfirm bind && pacman -Scc --noconfirm


VOLUME ["/etc/named.conf", "/var/bind"]
EXPOSE 53 53/udp
CMD /usr/sbin/named -g -4 -c /etc/named.conf -u named
