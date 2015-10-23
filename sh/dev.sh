#!/bin/sh

#sudo service httpd start
sudo nginx
sudo service mysqld start
systemctl start clamd
service webmin start
service shellinaboxd start