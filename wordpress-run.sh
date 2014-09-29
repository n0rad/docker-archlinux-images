#!/bin/bash
STATIC=${1:-/tmp/wordpress}
PORT=${2:-80}
echo "Storing database & files in $STATIC and serving on $PORT"
echo "./run.sh [persistent-dir] [port] to customize."
CONT=`docker run -d wordpress bash`
if [ ! -d "$STATIC/wordpress" ]; then
    docker cp $CONT:/wordpress $STATIC
fi
if [ ! -d "$STATIC/mysql" ]; then
    docker cp $CONT:/var/lib/mysql $STATIC
fi
docker run -i -t -p $PORT:80 -v $STATIC/wordpress:/wordpress -v $STATIC/mysql:/var/lib/mysql wordpress
