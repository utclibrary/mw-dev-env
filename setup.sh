#!/usr/bin/env bash
# Update packages
echo "Running yum update..."
yum -y update
#install MW if not already installed
# if  [ -e /var/www/html/index.php ]
# then
# echo "MediaWiki is already installed."
# else
# echo "Installing MediaWiki ..."
# wget https://releases.wikimedia.org/mediawiki/1.32/mediawiki-1.32.2.tar.gz
# tar xvzf  mediawiki*.tar.gz
# mv mediawiki-1.32.2/* /var/www/html/
# fi
echo "Installing editors ..."
yum -y install nano vim
echo "Installing PHP ..."
yum -y install epel-release yum-utils
yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum-config-manager --enable remi-php74
yum -y install php php-mcrypt php-cli php-gd php-curl php-intl php-mysql php-ldap php-zip php-fileinfo php-xml php-mbstring uzip wget
# echo "installing Composer and bootstrap for mediawiki" # see https://www.vultr.com/docs/install-composer-on-centos-7
# curl -sS https://getcomposer.org/installer | php
# mv composer.phar /usr/local/bin/composer
# composer update --no-dev "mediawiki/bootstrap"
# install MediaWikiBootstrap
# echo "mediawiki/bootstrap: ~4.0" > /var/www/html/composer.local.json
# cd /var/www/html
# composer update --no-dev "mediawiki/bootstrap"
# echo
yum -y install gcc php-devel php-pear
yum -y install ImageMagick ImageMagick-devel ImageMagick-perl

echo "Installing Apache ..."
yum -y install httpd
echo "Modify php.ini to show php errors"
echo "display_errors = On" >> /etc/php.ini
echo "Start Apache"
systemctl start httpd
echo "Installing MariaDB ..."
yum -y install mariadb-server
systemctl start mariadb
systemctl status mariadb

mysql -u root -e "CREATE database wiki_lib";
mysql -u root wiki_lib < /vagrant/wiki_lib.sql;
mysql -u root -e "CREATE USER 'wikiadmin'@'localhost' identified by 'Fr3sh1nstall'";
mysql -u root -e "GRANT ALL PRIVILEGES ON wiki_lib.* TO 'wikiadmin'@'localhost' WITH GRANT OPTION";

mysql -u root wiki_lib < /vagrant/wiki_lib.sql;
php /var/www/html/maintenance/update.php

setenforce 0
echo "use http://192.168.33.21"
echo "wikiadmin Fr3sh1nstall"
