#!/bin/bash

if [ -z "$1" ]; then
	echo "Please provide commit message"
	exit
fi

git add .
git commit -m "$1"
git push

scp -r ./index.nginx-debian.html root@137.184.61.238:/var/www/html
scp -r ./index.js root@137.184.61.238:/var/www/html
scp -r .styles.css root@137.184.61.238:/var/www/html

ssh root@137.184.61.238 "sudo systemctl restart nginx"
