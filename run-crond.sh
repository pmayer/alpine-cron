#!/bin/sh
ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone
cat - /tmp/crontab > /etc/crontabs/root
crond -f -l 2
