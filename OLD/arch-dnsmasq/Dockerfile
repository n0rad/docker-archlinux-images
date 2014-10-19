FROM n0rad/arch
MAINTAINER n0rad <alemaire@norad.fr>

RUN yaourt -S --noconfirm dnsmasq wget darkhttpd

RUN wget --no-check-certificate https://raw.github.com/jpetazzo/pipework/master/pipework
RUN chmod +x pipework

RUN rm /etc/dnsmasq.conf && ln -s /opt/conf/dnsmasq.conf /etc/dnsmasq.conf

RUN mkdir /opt/tftp /opt/conf

ADD ./image/dnsmasq.ini /etc/supervisor.d/dnsmasq.ini
ADD ./image/dnsmasq-start.sh /opt/dnsmasq-start.sh
VOLUME ["/var/log/supervisor", "/opt/conf", "/opt/tftp", "/var/lib/misc"]
CMD ["/usr/bin/supervisord"]
