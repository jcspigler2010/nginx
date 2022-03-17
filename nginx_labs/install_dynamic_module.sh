#!/bin/bash


sudo cat <<EOF >> /etc/nginx/moduletest.js
function moduleTest(res) {
 res.return(200, "The njs module was loaded\n");
}
EOF

sudo vi /etc/nginx/nginx.conf

js_include moduletest.js;

server {
 listen 80;
 location / {
 js_content moduleTest;
 }
}


sudo yum install nginx-module-njs -y

vi /etc/nginx/nginx.conf

load_module modules/ngx_http_js_module.so;
load_module modules/ngx_stream_js_module.so;

sudo nginx  -s reload
