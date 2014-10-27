# wordpress
FROM n0rad/arch-nginx-php-mariadb
MAINTAINER n0rad <alemaire@norad.fr>


RUN yaourt -S --noconfirm tt-rss tt-rss-theme-feedly-git tt-rss-videoframes-git php-mcrypt && pacman -Scc --noconfirm

RUN rm -Rf /srv/http
RUN ln -s /usr/share/webapps/tt-rss /srv/http



RUN sed -e "s/include_path =.*/include_path = \".:\/usr\/share\/pear:\/etc\/webapps\/tt-rss\"/" -i /etc/php/php.ini
RUN sed -e "s/open_basedir =.*/open_basedir =  \/srv\/http\/:\/home\/:\/tmp\/:\/usr\/share\/pear\/:\/usr\/share\/webapps\/:\/etc\/webapps\/:\/var\/lib\/tt-rss/" -i /etc/php/php.ini
RUN sed -e "s/;extension=mysqli.so/extension=mysqli.so/" -i /etc/php/php.ini
RUN sed -e "s/;extension=mcrypt.so/extension=mcrypt.so/" -i /etc/php/php.ini
RUN sed -e "s/;extension=curl.so/extension=curl.so/" -i /etc/php/php.ini
RUN sed -e "s/;extension=iconv.so/extension=iconv.so/" -i /etc/php/php.ini
RUN sed -e "s/;extension=posix.so/extension=posix.so/" -i /etc/php/php.ini
RUN sed -e "s/;extension=soap.so/extension=soap.so/" -i /etc/php/php.ini


ADD ./ttrss-cron.ini /etc/supervisor.d/ttrss-cron.ini
CMD ["/usr/bin/supervisord"]

