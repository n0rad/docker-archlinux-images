#!/bin/bash -x


if [ ! -f /srv/http/wp-config.php ]; then

  WORDPRESS_PASSWORD=$(pwgen -c -n -1 65)
  MYSQL_PASSWORD=`pwgen -c -n -1 12`
  echo $MYSQL_PASSWORD > /mysql-root-pw.txt 
  echo "WAITING 30s FOR MYSQL TO START"
  sleep 30
  /usr/bin/mysqladmin -u root password "$MYSQL_PASSWORD"
  mysql -uroot -p$MYSQL_PASSWORD -e "CREATE DATABASE wordpress; GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY '$WORDPRESS_PASSWORD'; FLUSH PRIVILEGES;"

  sed -e "s/database_name_here/wordpress/
  s/username_here/wordpress/
  s/password_here/$WORDPRESS_PASSWORD/
  /'AUTH_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'SECURE_AUTH_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'LOGGED_IN_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'NONCE_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'AUTH_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'SECURE_AUTH_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'LOGGED_IN_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'NONCE_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/" /srv/http/wp-config-sample.php > /srv/http/wp-config.php

fi




