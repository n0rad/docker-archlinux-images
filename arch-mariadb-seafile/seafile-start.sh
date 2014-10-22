#!/bin/sh
sleep 10

/opt/seafile-server-latest/seafile.sh start && /opt/seafile-server-latest/seahub.sh start

while true; do sleep 10; done

