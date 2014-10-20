# php
FROM n0rad/arch-nginx
MAINTAINER n0rad <alemaire@norad.fr>

RUN pacman -S --noconfirm php-fpm && pacman -Scc --noconfirm
ADD ./default /etc/nginx/sites-available/default
ADD ./index.php /srv/http/index.php
ADD ./php-fpm.ini /etc/supervisor.d/php-fpm.ini
