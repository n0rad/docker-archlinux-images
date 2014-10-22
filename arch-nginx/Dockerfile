# nginx
FROM n0rad/arch
MAINTAINER n0rad <alemaire@norad.fr>

RUN pacman -S --noconfirm nginx && pacman -Scc --noconfirm
RUN mkdir -p /etc/nginx/conf.d /etc/nginx/sites-available /etc/nginx/sites-enabled

ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./default /etc/nginx/sites-available/default
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
ADD ./nginx.ini /etc/supervisor.d/nginx.ini

EXPOSE 80 443

VOLUME ["/var/log/supervisor", "/etc/nginx/sites-enabled", "/var/log/nginx"]

CMD ["/usr/bin/supervisord"]
