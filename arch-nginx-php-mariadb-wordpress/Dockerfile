# wordpress
FROM n0rad/arch-nginx-php-mariadb
MAINTAINER n0rad <alemaire@norad.fr>

# Wordpress Requirements
RUN pacman -S --noconfirm php-apcu php-gd php-intl php-pear php-mcrypt php-memcache php-pspell php-sqlite php-tidy php-xsl imagemagick
RUN pecl config-set php_ini /etc/php/php.ini && pear config-set php_ini /etc/php/php.ini
RUN pecl channel-update pecl.php.net && echo yes | pecl -q install imagick

# php config
RUN sed -i "s/;\(extension=\(apcu\|curl\|imap\|intl\|ldap\|mcrypt\|memcache\|mysql\|mysqli\|pspell\|gd\|sqlite3\|tidy\|xmlrpc\|xsl\).so\)/\1/g" /etc/php/php.ini /etc/php/conf.d/*.ini
RUN sed -i "s/;cgi.fix_pathinfo=.*/cgi.fix_pathinfo=0/g" /etc/php/php.ini
RUN sed -i "s/upload_max_filesize =.*/upload_max_filesize = 1024M/g" /etc/php/php.ini
RUN sed -i "s/post_max_size =.*/post_max_size = 1024M/g" /etc/php/php.ini
RUN sed -i "s/open_basedir =/;open_basedir =/g" /etc/php/php.ini
RUN sed -i "s/;extension=mysql.so/extension=mysql.so/g" /etc/php/php.ini


#wordpress
RUN curl -SL https://wordpress.org/latest.tar.gz | tar -xzC /srv && rm -Rf /srv/http && mv /srv/wordpress /srv/http

ADD ./wordpress-start.sh /opt/wordpress-start.sh
ADD ./wordpress.ini /etc/supervisor.d/wordpress.ini
CMD ["/usr/bin/supervisord"]

