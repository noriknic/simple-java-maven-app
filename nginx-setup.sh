#!/bin/bash
version="1.10.3"

cd /usr/local/src
wget http://nginx.org/download/nginx-$version.tar.gz
tar zxvf nginx-$version.tar.gz
cd nginx-$version
./configure --prefix='/opt/nginx' --with-http_ssl_module --with-http_gzip_static_module --with-cc-opt='-Wno-error' --with-http_gzip_static_module --with-http_stub_status_module --with-http_realip_module
make
make install

cd /etc/init.d/
wget https://gist.githubusercontent.com/mustafaturan/2602605/raw/5ff622dd2f659622af736d6aa7d0c3577f9c38cf/nginx
chmod +x nginx

chkconfig --add nginx
chkconfig nginx on
service nginx start
