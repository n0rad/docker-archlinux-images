FROM n0rad/arch
MAINTAINER n0rad <alemaire@norad.fr>

RUN pacman -S --noconfirm wget 

RUN wget --no-check-certificate https://raw.github.com/jpetazzo/pipework/master/pipework
RUN chmod +x pipework


ADD ./image/firewall.ini /etc/supervisor.d/firewall.ini
ADD ./image/firewall-start.sh /opt/firewall-start.sh
VOLUME ["/var/log/supervisor"]
CMD ["/usr/bin/supervisord"]
