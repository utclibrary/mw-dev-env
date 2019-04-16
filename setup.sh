#!/usr/bin/env bash
# Update packages
echo "Running yum update..."
yum -y update
echo "Installing wget ..."
yum -y install wget
#install MW if not already installed
if  [ -e /var/www/html/index.php ]
then
echo "MediaWiki is already installed."
else
echo "Installing MediaWiki ..."
wget https://releases.wikimedia.org/mediawiki/1.32/mediawiki-1.32.0.tar.gz
tar xf  mediawiki*.tar.gz
mv mediawiki-1.32.0/* /var/www/html/
fi
echo "Installing editors ..."
yum -y install nano vim
echo "Installing PHP 7 ..."
yum -y install epel-release yum-utils
yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum-config-manager --enable remi-php73
yum -y install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo php-xml php-mbstring
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
if ! mysql -u root -e 'USE media_wiki'; then
mysql -u root -e "CREATE database media_wiki";
#mysql -u root LuptonDB < /vagrant/mw.sql;
mysql -u root -e "CREATE USER 'media_wiki'@'localhost' identified by 'mw123'";
mysql -u root -e "GRANT ALL PRIVILEGES ON media_wiki.* TO 'media_wiki'@'localhost'";
fi
echo "Installing git ..."
yum -y install git
#echo "Getting our git files"
#if [ -z "$(ls -A /var/www/html/)" ]; then
#   git clone https://github.com/utclibrary/liblab.git /var/www/html/
#else
   #cd /var/www/html/
   #git pull
#cd ~/
#fi

setenforce 0
echo "use 192.168.33.15 OR localhost:8080"
echo "media_wiki mw123"
