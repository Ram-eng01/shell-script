#!/bin/bash
#check if the user already exists and create if not exists.
#Generate random password and assign to the user
#Expire the password forcing the user to reset it
#make sure user has sudo persmission.
#echo '!@#$%^&*()_' | fold -w 1 | shuf | head -1
USER_NAME=$1
if [ $# -gt 0 ]
then
EXISTING_USER=$(cat /etc/passwd | grep -i -w ${USER_NAME} | cut -d ":" -f 1)
if [ "${USER_NAME}" = "${EXISTING_USER}" ]; then
    echo "The user ${USER_NAME} already exists. Try a different username."
else
    echo "lets create user ${USER_NAME}"
    sudo useradd -m $USER_NAME --shell /bin/bash -d /home/${USER_NAME}
    sudo usermod -a -G root $USER_NAME
    SPEC=$(echo '!@#$%^&*()_' | fold -w1 | shuf | head -1)
    PASSWORD="India@${RANDOM}${SPEC}"
    echo "${USER_NAME}:${PASSWORD}" | sudo chpasswd
    passwd -e ${USER_NAME}
    echo "The temporary credendials are ${USER_NAME} and ${PASSWORD}"
fi
else
    echo "You have given $# arguments. Please provide atleast one argument."
fi