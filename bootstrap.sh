#!/usr/bin/env bash

test -f /etc/bootstrapped && exit

apt-get update

# Install Vim
apt-get install -y vim

# Apache
apt-get install -y apache2
# Add ServerName to httpd.conf
echo "ServerName localhost" > /etc/apache2/httpd.conf
cp /vagrant/vhosts/lampdemo.conf /etc/apache2/sites-available/lampdemo
a2ensite lampdemo
# Disable default
a2dissite default

# PHP
# ---
apt-get install -y php5
apt-get install -y libapache2-mod-php5
apt-get install -y php5-cli
apt-get install -y php5-mysql
apt-get install -y php5-curl
apt-get install -y php5-mcrypt
apt-get install -y php5-memcache
apt-get install -y php5-memcached
apt-get install -y php5-xdebug
apt-get install -y php5-imagick
apt-get install -y php5-geoip
apt-get install -y php5-sqlite

# cURL
# ----
apt-get install -y curl

# Mysql
# -----
# Ignore the post install questions
export DEBIAN_FRONTEND=noninteractive
# Install MySQL quietly
apt-get -q -y install mysql-server-5.5
# Set root password
mysql -uroot -pnewpassword -e 'SELECT CURDATE();' || /usr/bin/mysqladmin -u root password 'admin123'
# Bootstrap db
mysql --user=root --password=admin123 --host=localhost --port=3306 < /vagrant/mysql/bootstrap.sql
mysql --user=root --password=admin123 --host=localhost --port=3306 < /vagrant/mysql/lampdemo.sql
# Open MySQL to host machine by overwriting my.cnf
cp /vagrant/mysql/my.cnf /etc/mysql/my.cnf
# Restart MySQL
service mysql restart

# Git
# ---
apt-get install -y git

# Install Composer
# ----------------
curl -s https://getcomposer.org/installer | php
# Make Composer available globally
mv composer.phar /usr/local/bin/composer

# Update hosts file
# -----------------
echo "192.168.33.10 lcl.lampdemo" >> /etc/hosts

# Memcache
# --------
apt-get install -y memcached
apt-get install -y php-pear
apt-get install -y build-essential
pecl install -y memcache
echo "extension=memcache.so" | sudo tee /etc/php5/conf.d/memcache.ini

service apache2 restart

touch /etc/bootstrapped

