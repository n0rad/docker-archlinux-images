# wordpress
FROM n0rad/arch-nginx-php-mariadb
MAINTAINER n0rad <alemaire@norad.fr>


RUN yaourt -S --noconfirm wget unzip php-gd imagemagick && pacman -Scc --noconfirm
RUN wget http://piwigo.org/download/dlcounter.php?code=latest
RUN unzip /dlcounter* && rm /dlcounter* && rm -Rf /srv/http && mv /piwigo* /srv/http


#RUN rm -Rf /srv/http
#RUN ln -s /usr/share/webapps/tt-rss /srv/http



RUN sed -e "s/;date.timezone =.*/date.timezone = \"Europe\/Paris\"/" -i /etc/php/php.ini


#RUN sed -e "s/include_path =.*/include_path = \".:\/usr\/share\/pear:\/etc\/webapps\/tt-rss\"/" -i /etc/php/php.ini
#RUN sed -e "s/open_basedir =.*/open_basedir =  \/srv\/http\/:\/home\/:\/tmp\/:\/usr\/share\/pear\/:\/usr\/share\/webapps\/:\/etc\/webapps\/:\/var\/lib\/tt-rss/" -i /etc/php/php.ini


RUN sed -e "s/;extension=mysql.so/extension=mysql.so/" -i /etc/php/php.ini
#RUN sed -e "s/;extension=mysqli.so/extension=mysqli.so/" -i /etc/php/php.ini
RUN sed -e "s/;extension=curl.so/extension=curl.so/" -i /etc/php/php.ini
RUN sed -e "s/;extension=exif.so/extension=exif.so/" -i /etc/php/php.ini
RUN sed -e "s/;extension=gd.so/extension=gd.so/" -i /etc/php/php.ini
#RUN sed -e "s/;extension=pdo_mysql.so/extension=pdo_mysql.so/" -i /etc/php/php.ini


#ADD ./ttrss-cron.ini /etc/supervisor.d/ttrss-cron.ini
CMD ["/usr/bin/supervisord"]

