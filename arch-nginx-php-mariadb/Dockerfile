# mariadb
FROM n0rad/arch-nginx-php
MAINTAINER n0rad <alemaire@norad.fr>

RUN pacman -S --noconfirm mariadb mariadb-clients pwgen && pacman -Scc --noconfirm
RUN rm -Rf /var/lib/mysql/*

ADD ./mariadb-init.sh /opt/mariadb-init.sh
ADD ./mariadb.ini /etc/supervisor.d/mariadb.ini
VOLUME ["/etc/mysql", "/var/lib/mysql", "/var/log/supervisor"]
CMD ["/usr/bin/supervisord"]
