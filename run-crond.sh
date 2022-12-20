#!/bin/sh
ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone
if [ -n "${SENTRY_DSN}" ]; then echo "SENTRY_DSN=${SENTRY_DSN}"; fi | cat - /tmp/crontab > /etc/crontabs/root
crond -f -l 2
