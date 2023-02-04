#!/bin/bash

echo "Enter user name"

read -r username

flag=$(cut -d: -f1 /etc/passwd | grep "$username")

if [ "$flag" ]
then
  echo "User already exists"
elase
  useradd "$username"
fi
