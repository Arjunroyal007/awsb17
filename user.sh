#!/bin/bash
read -p "enter user name : " USER_NAME
read -s -p "enter password : " PASSWORD
if [ -z $USER_NAME ];
then
        echo "is not valid"
else
EXISTING_USER=$(cat /etc/passwd | grep -w $USER_NAME | cut -d ":" -f1)
echo "entered user name is : " $USER_NAME
echo "entered password is : " $PASSWORD
echo "existing info is : " $EXISTING_USER
password=$(echo "@#&^$" | fold -w 2 | shuf | head -n 1)
RANDVALE=$(echo ${RANDOM})
MYPASSWORD=$PASSWORD$password$RANDVALE
echo "AFTER CONCATINATING MYPASSWORD IS : "$MYPASSWORD
if [ "$USER_NAME" == "$EXISTING_USER" ];then
        echo $USER_NAME "user is already exists"
else
        echo $USER_NAME "user is not present please create user"
        useradd $USER_NAME
        echo "$USER_NAME:$PASSWORD"| sudo chpasswd
        echo $USER_NAME "is successfully created"

fi
fi

