# wordpress
FROM n0rad/arch-nginx-php-mariadb
MAINTAINER n0rad <alemaire@norad.fr>


RUN yaourt -S --noconfirm tt-rss tt-rss-theme-feedly-git tt-rss-videoframes-git && pacman -Scc --noconfirm

rm -Rf /srv/http
ln -s /usr/share/webapps/tt-rss /srv/http


#ADD ./wordpress-start.sh /opt/wordpress-start.sh
#ADD ./wordpress.ini /etc/supervisor.d/wordpress.ini
CMD ["/usr/bin/supervisord"]

