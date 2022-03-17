#!/bin/bash

rm -f /tmp/nginx.repo

cat <<EOF >> /tmp/nginx.repo
[nginx]
name=nginx repo
baseurl=https://nginx.org/packages/mainline/centos/7/x86_64/
gpgcheck=0
enabled=1
EOF

sudo mv /tmp/nginx.repo /etc/yum.repos.d/
sudo chown root:root /etc/yum.repos.d/nginx.repo

sudo yum update -y && sudo yum install nginx -y

sudo nginx

curl localhost
