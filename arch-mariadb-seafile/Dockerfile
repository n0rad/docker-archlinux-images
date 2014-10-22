FROM n0rad/arch-mariadb
MAINTAINER n0rad <alemaire@norad.fr>

RUN yaourt -S --noconfirm wget python2-pillow mysql-python libselinux && pacman -Scc --noconfirm
RUN useradd -u 500 seafile

## should install seafile here but install
#
#
#

ADD ./seafile-start.sh /seafile-start.sh
ADD ./seafile.ini /etc/supervisor.d/seafile.ini
VOLUME ["/opt"]
WORKDIR /opt
EXPOSE 8082 10001 12001
CMD ["/usr/bin/supervisord"] 


