#!/bin/bash -x

shopt -s nullglob
files=(/var/lib/mysql/*)
if [ ${#files[@]} -eq 0 ]; then
  MYSQL_PASSWORD=`pwgen -c -n -1 12`
  echo $MYSQL_PASSWORD > /mysql-root-pw.txt
  /usr/bin/mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
  /usr/bin/mysqladmin -u root password "$MYSQL_PASSWORD"
fi


su - mysql -s /bin/sh -c '/usr/bin/mysqld --pid-file=/run/mysqld/mysqld.pid --skip-name-resolve --datadir=/var/lib/mysql'



