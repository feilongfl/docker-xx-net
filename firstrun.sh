#!/bin/sh

sh /opt/xx-net/start.sh &
sleep 30
curl http://127.0.0.1:8085/config?cmd=set_config&allow_remote_connect=1
