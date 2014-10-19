FROM n0rad/arch-pipework
MAINTAINER n0rad <alemaire@norad.fr>

RUN pacman -S --noconfirm dhcp && pacman -Scc --noconfirm

VOLUME ["/etc/dhcpd.conf", "/var/lib/dhcp/dhcpd.leases", "/etc/rndc.key"]
CMD \
  /pipework --wait &&\
  dhcpd -f
