#!/bin/bash

if [ ! -d /data/demo ]; then
    cp -a /usr/local/samples /data/demo
fi

sudo /etc/init.d/ssh start
exec /usr/local/bin/nimbix_notebook "$@"
