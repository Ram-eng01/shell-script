#!/bin/bash
#check if the user already exists and create if not exists.
#Generate random password and assign to the user
#Expire the password forcing the user to reset it
#make sure user has sudo persmission.

USER_NAME=$1
if [ $# -gt 0 ]
then
EXISTING_USER=$(cat /etc/passwd | grep -i -w ${USER_NAME} | cut -d ":" -f 1)
if [ "${USER_NAME}" = "${EXISTING_USER}" ]; then
    echo "The user ${USER_NAME} already exists. Try a different username."
else
    echo "lets create user ${USER_NAME}"
fi
else
    echo "You have given $# arguments. Please provide atleast one argument."
fi