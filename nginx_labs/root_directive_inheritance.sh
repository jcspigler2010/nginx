#!/bin/bash

sudo mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.bak
sudo vi /etc/nginx/conf.d/inherit_test.conf

sudo nginx -s reload

sudo vi /etc/nginx/conf.d/inherit_test.conf

# location / {
# }
# location /test {
# root /media;
# }

curl localhost/
curl localhost/test
