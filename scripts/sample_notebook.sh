#!/bin/bash

if [ ! -d /data/demo ]; then
    cp -a /usr/local/samples /data/demo
fi

sudo /root/spark-2.2.0-bin-hadoop2.7/sbin/start-master.sh
sudo /etc/init.d/ssh start
exec /usr/local/bin/nimbix_notebook "$@"
