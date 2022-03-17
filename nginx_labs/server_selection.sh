sudo mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.bak
sudo vi /etc/nginx/conf.d/server_test.conf

# server {
# listen 80;
# return 200 "this server listens on 0.0.0.0:80\n";
# }

# server {
# listen 127.0.0.1:80;
# return 200 "this server listens on 127.0.0.1:80\n";
# }

curl http://localhost
sudo  vi /etc/hosts
127.0.0.1 www.example.com
127.0.0.1 example.com

curl www.example.com
curl example.com

sudo vi /etc/nginx/conf.d/server_test.conf

# server {
# server_name example.com;
# return 200 "This is server1\n";
# }

# server {
# server_name www.example.com;
# return 200 "This is server2\n";
# }

sudo nginx -s reload

curl www.example.com
curl example.com


sudo vi /etc/nginx/conf.d/server_test.conf

# server {
# server_name example.com;
# return 200 "This is server1\n";
# }

# server {
# server_name *.example.com;
# return 200 "This is server2\n";
# }

sudo nginx -s reload

sudo vi /etc/nginx/conf.d/server_test.conf

# server {
# server_name example.com;
# return 200 "This is server1\n";
# }

# server {
# server_name www.example.*;
# return 200 "This is server2\n";
# }

sudo nginx -s reload

sudo vi  /etc/nginx/conf.d/server_test.conf

# server {
# server_name ~^(www|host1).*\.example\.com$;
# return 200 "This is server1\n";
# }

# server {
# server_name ~^(subdomain|set|www|host1).*\.example\.com$;;
# return 200 "This is server2\n";
# }

sudo nginx -s reload

sudo vi  /etc/nginx/conf.d/server_test.conf

# server {
#  listen 127.0.0.1 default_server;
#  return 200 "This is the default server";
# }

# server {
# server_name ~^(www|host1).*\.example\.com$;
# return 200 "This is server1\n";
# }

# server {
# server_name ~^(subdomain|set|www|host1).*\.example\.com$;;
# return 200 "This is server2\n";
# }

sudo nginx -s reload
