#!/bin/bash

# remove proxy system variables
unset http_proxy
unset https_proxy
unset ftp_proxy

# remove proxy configuration file for apt and apt-get
rm /etc/apt/apt.conf.d/proxy.conf

# unset proxy for wget
sed -i '85s/.*/#http-proxy=http:\/\/192\.168\.49\.1:8000/'  /etc/wgetrc
sed -i '86s/.*/#https-proxy=http:\/\/192\.168\.49\.1:8000/' /etc/wgetrc
sed -i '87s/.*/#ftp-proxy=http:\/\/192\.168\.49\.1:8000/'   /etc/wgetrc
sed -i '90s/.*/#use_proxy=on/'				    /etc/wgetrc

# unset proxy for git
git config --global --unset http.proxy

# unset proxy for chrome (only for root user)
sed -i '1s/.*/exec \-a \"\$0\" \"\$HERE\/chrome\" \"\$\@\"/'  /usr/bin/google-chrome-stable
