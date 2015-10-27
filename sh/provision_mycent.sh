#!/bin/sh
sudo yum update -y
sudo wget http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
rpm -Uvh mysql-community-release-el7-5.noarch.rpm
sudo yum -y install sl tree cowsay lynx vim ruby php php-fpm php-mysql perl perl-Net-SSLeay openssl perl-IO-Tty mysql-community-server nginx epel-release git clamd openssl shellinabox 
sudo chkconfig clamd on
sudo chkconfig --add nginx
sudo chkconfig nginx on
sudo chkconfig php-fpm on
sudo chkconfig mysqld on
sudo chkconfig shellinaboxd on
sudo sed -i 's/^Example/#Example/g' /etc/freshclam.conf
cd $HOME/
wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/Vim/vimrc
mv vimrc .vimrc
sudo freshclam
vim --version
git --version
ruby --version
mysql --version
nginx -v
php -v
