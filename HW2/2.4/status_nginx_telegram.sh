#!/bin/bash

TOKEN="6095982572:AAFgg6_e9NRzgEGRI-l_yAyzIp9NUVexkps"
ID="361939818"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"
pattert="200 OK"

while true
do
  result=$(curl -Iks head 1 127.0.0.1 | head -1 | grep -o "200 OK")
  if [[ $result != "$pattert" ]]
  then
    curl -s -X POST $URL -d chat_id=$ID -d text="NGINX is not running"
    systemctl start nginx
  fi
  sleep 60
done
