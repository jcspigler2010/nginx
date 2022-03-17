#!/bin/sh
sudo mv  /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.bak
sudo  vi /etc/nginx/conf.d/location_test.conf


# server {
#  listen 80 default_server;
#  server_name localhost;
#  location / {
#     return 200 "this is the / context \n";
# }
#
#  location /test {
#     return 200 "this is the /test location \n";
#  }
# }
sudo nginx -s reload

sudo  vi /etc/nginx/conf.d/location_test.conf


# server {
#  listen 80 default_server;
#  server_name localhost;
#  location / {
#     return 200 "this is the / context \n";
# }
#
#  location /test {
#     return 200 "this is the /test location \n";
#  }
#  location /test/ {
#     return 200 "this is /test/ location \n";
#  }
# }

sudo nginx  -s reload

sudo  vi /etc/nginx/conf.d/location_test.conf


# server {
#  listen 80 default_server;
#  server_name localhost;
#  location / {
#     return 200 "this is the / location \n";
#   }
#  location ~* ^/test(\d+)$ {
#     return 200 "this is the first regex location, /test$1 \n";
#   }
#  location ~ ^/test/(\d+)$ {
#     return 200 "this is the second regex location, /test/$1 \n";
#   }
# }

sudo nginx  -s reload

sudo  vi /etc/nginx/conf.d/location_test.conf


# server {
#  listen 80 default_server;
#  server_name localhost;
#  location / {
#     return 200 "this is the / location \n";
#   }
#  location ~* ^/test(\d+)$ {
#     return 200 "this is the first regex location, /test$1 \n";
#   }
#  location /test/1234 {
#     return 200 "this is the /test/1234 prefix location \n";
#   }
#  location ~ ^/test/(\d+)$ {
#     return 200 "this is the second regex location, /test/$1 \n";
#   }
# }

sudo nginx  -s reload

[ec2-user@ip-10-0-1-167 ~]$ curl http://localhost/test/12345678
this is the second regex location, /test/12345678
[ec2-user@ip-10-0-1-167 ~]$ curl http://localhost/test/1234
this is the second regex location, /test/1234
