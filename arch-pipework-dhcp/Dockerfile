FROM n0rad/arch-pipework
MAINTAINER n0rad <alemaire@norad.fr>

RUN pacman -S --noconfirm dhcp && pacman -Scc --noconfirm

RUN mkdir /data && mv /etc/dhcpd.conf /var/lib/dhcp/dhcpd.leases /data
RUN ln -s /data/dhcpd.conf /etc/dhcpd.conf && \
  ln -s /data/dhcpd.leases /var/lib/dhcp/dhcpd.leases

VOLUME ["/data"]
CMD \
  /pipework --wait &&\
  dhcpd -f
