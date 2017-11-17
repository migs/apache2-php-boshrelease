#!/usr/bin/env bash

JOB=httpd
RUN_DIR=/var/vcap/sys/run/${JOB}
LOG_DIR=/var/vcap/sys/log/${JOB}
PIDFILE=${RUN_DIR}/pid

case ${1} in
    start)
        mkdir -p $RUN_DIR $LOG_DIR
        chown -R vcap:vcap $RUN_DIR $LOG_DIR
        echo $$ > $PIDFILE
        cd /var/vcap/packages/${JOB}
        exec /var/vcap/packages/${JOB}/
