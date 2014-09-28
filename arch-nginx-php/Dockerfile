FROM n0rad/nginx
MAINTAINER n0rad <alemaire@norad.fr>

RUN pacman -Syu --noconfirm php-fpm
RUN pacman -Scc --noconfirm
ADD ./default /etc/nginx/sites-available/default
ADD ./index.php /srv/http/index.php
ADD ./php-fpm.ini /etc/supervisor.d/php-fpm.ini

