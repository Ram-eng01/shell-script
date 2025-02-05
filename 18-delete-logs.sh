#!/bin/bash

SOURCE_DIR=/tmp/app-logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ -d $SOURCE_DIR]
then
    echo -e "$G source directory exists $N"
else
    echo -e "$R please make sure $SOURCE_DIR exits $N" 
    exit 1
fi