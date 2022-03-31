# Vagrant-wordpress
 
 Simple vagrant setup for deploying [NoviNano](https://github.com/mplesha/NoviNano)

## Description

Two vms on debian/bullseye64:
* db - mariadb
* web - nginx + php-fpm

All configuration file is in provision directory:
* nginx configs
   * nginx.conf
   * php.conf                      - php fastcgi config
   * allowed.conf                  - lіst of allowed hosts to /wp-login.php
* SQL Scripts
   * mysql_secure_installation.sql - secure installation of mysql 
   * wp.sql                        - create database for wordpress
* Bash scripts for provisioning
   * setupdb.sh                    - provisioning db
   * setupweb.sh                   - provisioning web

## Dependencies

* Vagrant
* VirtualBox

## Installation

```
git clone https://github.com/konquer62/vagrant-wordpress.git
cd vagrant-wordpress
vagrant up
```

## Default credentials

* Default IP addresses:
   * 192.168.33.10 for web
   * 192.168.33.11 for db

* Mariadb:
  * Default root password: 'qwerty'
  * Database: 'wp_database'
  * User: 'admin'
  * Password: 'test_pass'

mysql_secure_installation.sql and wp.sql for more details
