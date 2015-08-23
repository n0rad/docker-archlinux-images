#!/bin/sh
sleep 10

/opt/seafile-server-latest/seafile.sh start
sleep 10
/opt/seafile-server-latest/seahub.sh start-fastcgi

while true; do sleep 10; done

