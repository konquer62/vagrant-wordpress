#!/bin/bash

echo "Refreshing repository index..."
sudo apt-get update > /dev/null

echo "Installing MariaDB..."
sudo apt-get install -y mariadb-server > /dev/null

echo "Creating DB and granting user connections from remote hosts..."
sudo mysql < /vagrant/provision/wp.sql

echo "Runing mysql secure installation..."
sudo mysql < /vagrant/provision/mysql_secure_installation.sql

echo "Configuring MariaDB..."
sudo cp -f /vagrant/provision/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

echo "Enabling and restarting mariadb..."
sudo systemctl enable mariadb
sudo systemctl restart mariadb