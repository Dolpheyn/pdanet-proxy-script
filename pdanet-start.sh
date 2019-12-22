#!/bin/bash

# set http proxy
export http_proxy=http://192.168.49.1:8000/
export https_proxy=http://192.168.49.1:8000/
export ftp_proxy=http://192.168.49.1:8000/

# set http proxy for apt and apt-get
touch /etc/apt/apt.conf.d/proxy.conf
echo 'Acquire{HTTP::proxy "http://192.168.49.1:8000";HTTPS::proxy "http://192.168.49.1:8000";}' > /etc/apt/apt.conf.d/proxy.conf

# set http proxy for wget
sed -i '85s/.*/http-proxy=http:\/\/192\.168\.49\.1:8000/'  /etc/wgetrc
sed -i '86s/.*/https-proxy=http:\/\/192\.168\.49\.1:8000/' /etc/wgetrc
sed -i '87s/.*/ftp-proxy=http:\/\/192\.168\.49\.1:8000/'   /etc/wgetrc
sed -i '90s/.*/use_proxy=on/'				    /etc/wgetrc

# set http proxy for git
git config --global http.proxy http://192.168.49.1:8000

# set http proxy for google chrome
sed -i '1s/.*/exec \-a \"\$0\" \"\$HERE\/chrome\" \"\$\@\" \-\-no\-sandbox \-\-user\-data\-dir \-\-proxy\-server\=http:\/\/192\.168\.49\.1\:8000/' text.txt
