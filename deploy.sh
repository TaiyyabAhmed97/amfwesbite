#!/bin/bash
git add .
git commit -m "$1"
git push

scp -r ../amfwebsite/index.nginx-debian.html root@137.184.61.238:/var/www/html
scp -r ../amfwebsite/index.js root@137.184.61.238:/var/www/html
scp -r ../amfwebsite/styles.css root@137.184.61.238:/var/www/html

ssh root@137.184.61.238 "sudo systemctl restart nginx"
