#!/bin/bash

url=$1
file_name=$2
# echo $url
# echo $file_name
# echo ${url#https://drive.google.com/file/d/}
url_p1=${url#https://drive.google.com/file/d/}
# echo ${url_p1%/[^\t\n\f\r]*}
url_p2=${url_p1%/[^\t\n\f\r]*}

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=$url_p2' -O- | sed -rn 's/.confirm=([0-9A-Za-z_]+)./\1\n/p')&id=$url_p2" -O $file_name && rm -rf /tmp/cookies.txt
