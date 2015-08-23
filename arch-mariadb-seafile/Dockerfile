FROM n0rad/arch-mariadb
MAINTAINER n0rad <alemaire@norad.fr>

RUN yaourt -S --noconfirm wget python2-pillow mysql-python libselinux && pacman -Scc --noconfirm
RUN pacman -S --noconfirm nginx && pacman -Scc --noconfirm
RUN useradd -u 500 seafile

## should install seafile here but install
#
#
#

ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./default /etc/nginx/sites-enabled/default
ADD ./nginx.ini /etc/supervisor.d/nginx.ini

ADD ./seafile-start.sh /seafile-start.sh
ADD ./seafile.ini /etc/supervisor.d/seafile.ini
VOLUME ["/data"]
WORKDIR /data
EXPOSE 80
CMD ["/usr/bin/supervisord"] 


