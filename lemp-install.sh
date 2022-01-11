#!/bin/bash

sudo apt remove --purge php* nginx* mariadb* certbot -y
sudo rm -R /etc/nginx
sudo rm -R /etc/php

sudo add-apt-repository ppa:ondrej/php
sudo apt update 
sudo apt upgrade -y
sudo apt install php8.1 php8.1-fpm php8.1-mysql nginx mariadb-server mariadb-client certbot python3-certbot-nginx -y		

sudo apt remove --purge apache* -y
sudo rm -R /etc/apache2
sudo apt autoremove -y

sudo mysql_secure_installation

sudo iptables -I INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 443 -j ACCEPT

sudo rm -R /usr/share/nginx/html
sudo rm -R /var/www
sudo mkdir -p /var/www/default

sudo wget -O /var/www/default/info.php https://raw.githubusercontent.com/vpslabs/lemp/main/var/www/default/info.php

sudo wget -O /var/www/default/index.php https://raw.githubusercontent.com/vpslabs/lemp/main/var/www/default/index-black.php

sudo usermod -aG www-data $USER

sudo chown www-data:www-data /var/www -R
sudo chmod -R 775 /var/www

sudo rm /etc/nginx/sites-enabled/*
sudo rm /etc/nginx/conf.d/*

sudo wget -O /etc/nginx/conf.d/default.conf https://raw.githubusercontent.com/vpslabs/lemp/main/etc/nginx/conf.d/default.conf

sudo mkdir -p /etc/nginx/snippets
sudo wget -O /etc/nginx/snippets/fastcgi-php.conf https://raw.githubusercontent.com/vpslabs/lemp/main/etc/nginx/snippets/fastcgi-php.conf
sudo wget -O /etc/nginx/fastcgi.conf https://raw.githubusercontent.com/vpslabs/lemp/main/etc/nginx/fastcgi.conf

sudo systemctl enable nginx
sudo systemctl start nginx

sudo systemctl enable mariadb
sudo systemctl start mariadb

sudo systemctl enable php8.1-fpm
sudo systemctl start php8.1-fpm

sudo wget -O /usr/bin/domain https://raw.githubusercontent.com/vpslabs/lemp/main/usr/local/bin/domain.sh
sudo chmod +x /usr/bin/domain
