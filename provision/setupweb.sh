#!/bin/bash

echo "Refreshing repository index..."
sudo apt-get update > /dev/null

echo "Installing Nginx..."
sudo apt-get install -y nginx > /dev/null

echo "Removing default folder..."
sudo rm -rf /var/www/html

echo "Creating /var/www/novinano..."
sudo mkdir /var/www/novinano

echo "Seting file permissions and ownership to www-data..."
sudo chown www-data:www-data /var/www/novinano

echo "Downloading novinano..."
sudo wget -O /var/www/novinano/installer.php \
https://github.com/mplesha/NoviNano/releases/download/v1.0/20180706_novinano_ts_976c110733e7eff58704180706072907_installer.php \
> /dev/null

sudo wget \
https://github.com/mplesha/NoviNano/releases/download/v1.0/20180706_novinano_ts_976c110733e7eff58704180706072907_archive.zip \
-P /var/www/novinano > /dev/null

echo "Installing PHP..."
sudo apt-get install -y php7.4-fpm php7.4-mysql php7.4-xml php7.4-gd php7.4-zip > /dev/null

echo "Configuring Nginx..."
sudo cp -f /vagrant/provision/nginx.conf /etc/nginx/nginx.conf
sudo cp /vagrant/provision/allowed.conf /etc/nginx/snippets/allowed.conf
sudo cp /vagrant/provision/php.conf /etc/nginx/snippets/php.conf
sudo systemctl reload nginx
