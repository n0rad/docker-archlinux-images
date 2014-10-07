#!/bin/bash

shopt -s nullglob
files=(/var/lib/mysql/*)
if [ ${#files[@]} -eq 0 ]; then
  /usr/bin/mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi

su - mysql -s /bin/sh -c '/usr/bin/mysqld --pid-file=/run/mysqld/mysqld.pid --skip-name-resolve --datadir=/var/lib/mysql'



