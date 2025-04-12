#!/bin/bash

if [ -z "$1" ]; then
	echo "Please provide commit message"
	exit
fi

git add .
git commit -m "$1"
git push

scp -r ./*.html root@137.184.61.238:/var/www/html
scp -r ./*.js root@137.184.61.238:/var/www/html
scp -r ./*.css root@137.184.61.238:/var/www/html

ssh root@137.184.61.238 "sudo systemctl restart nginx"
