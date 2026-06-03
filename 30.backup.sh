#!/bin/bash


src=/var/log/httpd/access_log
dest=mybackup

time=$(date +"%Y-%m-%d-%H-%M-%S")

backupfile=$dest/$time.tgz

echo "tacking backup"

tar zcvf $backupfile --absolute-name $src
