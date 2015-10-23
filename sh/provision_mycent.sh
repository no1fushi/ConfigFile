#!/bin/sh

#install
	sudo yum update
	#set
	sudo yum install -y clamd
	sudo yum -y install perl-Net-SSLeay
	sudo yum -yinstall python-pip
	#develop
	sudo yum install -y ruby
	sudo yum install -y nginx
	sudo yum install -y php
	sudo yum install -y php-fpm
	sudo yum install -y php-mysql
	sudo yum install -y git
	sudo rpm -i http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
	sudo rpm -i http://download.webmin.com/download/yum/webmin-1.770-1.noarch.rpm
	sudo rpm -i http://downloads.mysql.com/archives/get/file/MySQL-client-5.6.20-1.linux_glibc2.5.x86_64.rpm
	sudo rpm -i http://downloads.mysql.com/archives/get/file/MySQL-server-5.6.20-1.linux_glibc2.5.x86_64.rpm
	sudo rpm -i http://downloads.mysql.com/archives/get/file/MySQL-shared-compat-5.6.20-1.linux_glibc2.5.x86_64.rpm
	sudo rpm -i http://downloads.mysql.com/archives/get/file/MySQL-devel-5.6.20-1.linux_glibc2.5.x86_64.rpm
	sudo yum install -y openssl shellinabox
	sudo yum install -y vim
	#fun
	sudo yum install -y sl
	sudo yum install -y cowsay
	#tool
	sudo yum install -y lynx
	sudo pip install -y rainbowstream

#setup
	#clamd
	sed -i 's/^Example/#Example/g' /etc/freshclam.conf
	freshclam
