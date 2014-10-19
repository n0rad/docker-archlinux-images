#!/bin/bash
chmod a+rx /
if [ ! -f /wordpress/wp-config.php ]; then
  mysqld_safe --user=mysql &
  sleep 5
  # Here we generate random passwords (thank you pwgen!). The first two are for mysql users, the last batch for random keys in wp-config.php
  WORDPRESS_DB="wordpress"
  MYSQL_PASSWORD=`pwgen -c -n -1 12`
  WORDPRESS_PASSWORD=`pwgen -c -n -1 12`
  #This is so the passwords show up in logs. 
  echo mysql root password: $MYSQL_PASSWORD
  echo wordpress password: $WORDPRESS_PASSWORD
  echo $MYSQL_PASSWORD > /mysql-root-pw.txt
  echo $WORDPRESS_PASSWORD > /wordpress-db-pw.txt

  sed -e "s/database_name_here/$WORDPRESS_DB/
  s/username_here/$WORDPRESS_DB/
  s/password_here/$WORDPRESS_PASSWORD/
  /'AUTH_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'SECURE_AUTH_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'LOGGED_IN_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'NONCE_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'AUTH_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'SECURE_AUTH_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'LOGGED_IN_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'NONCE_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/" /wordpress/wp-config-sample.php > /wordpress/wp-config.php

  # Download nginx helper plugin
  curl -O `curl -i -s http://wordpress.org/plugins/nginx-helper/ | egrep -o "http://downloads.wordpress.org/plugin/[^']+"`
  unzip nginx-helper.*.zip -d /wordpress/wp-content/plugins
  chown -R http:http /wordpress

  # Activate nginx plugin and set up pretty permalink structure once logged in
  cat << ENDL >> /wordpress/wp-config.php
\$plugins = get_option( 'active_plugins' );
if ( count( \$plugins ) === 0 ) {
  require_once(ABSPATH .'/wp-admin/includes/plugin.php');
  \$wp_rewrite->set_permalink_structure( '/%postname%/' );
  \$pluginsToActivate = array( 'nginx-helper/nginx-helper.php' );
  foreach ( \$pluginsToActivate as \$plugin ) {
    if ( !in_array( \$plugin, \$plugins ) ) {
      activate_plugin( '/wordpress/wp-content/plugins/' . \$plugin );
    }
  }
}
ENDL

  mysqladmin -u root password $MYSQL_PASSWORD 
  mysql -uroot -p$MYSQL_PASSWORD -e "CREATE DATABASE wordpress; GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY '$WORDPRESS_PASSWORD'; FLUSH PRIVILEGES;"
  killall mysqld
fi

# start all the services
supervisord -c /etc/supervisord.conf
