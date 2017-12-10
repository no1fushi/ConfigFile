#!/bin/bash

#Apt
yes | sudo apt-get update
yes | sudo apt-get upgrade
yes | sudo apt-get dist-upgrade

#ssh
ssh-keygen -t rsa
mv ~/id_rsa.pub ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

#Lang
yes | sudo apt-get install gcc gauche
yes | sudo apt-get install node npm

#Editor
yes | sudo apt-get install vim emacs24

#Tool
yes | sudo apt-get install tree curl
yes | sudo apt-get install git
yes | sudo apt-get install fortune

#Ruby
apt-get install gcc-6 autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
exec $SHELL -l
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install 2.4.1
rbenv rehash
rbenv global 2.4.1

#RootMail
yes | sudo apt-get install ssmtp sendmail-base

#Logwatch
yes | sudo apt-get install logwatch

#Meteor
yes | sudo apt-get install g++ build-essential debian-keyring autoconf automake libtool flex bison scons git mongodb
$HOME/meteor/meteor --version

#GemPackages
yes | gem install discordrb gmail net-ping bigdecimal

#Libsodium
wget https://download.libsodium.org/libsodium/releases/libsodium-1.0.15.tar.gz
tar -zxvf libsodium-1.0.15.tar.gz
rm -rf libsodium-1.0.15
cd libsodium-1.0.15
./configure
make && make check
sudo make install
cd
rm -rf libsodium-1.0.15/
 
#Joke
yes | sudo apt-get install sl cowsay
yes | gem install cureutils matsuya
yes | gem install rubipara takarabako
yes | sudo npm install -g faker-cli emspect
yes | sudo apt-get install screenfetch

#SetupEditor
wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/Vim/.vimrc
cd ~/.emacs.d
wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/emacs/init.el
sudo su
cd
wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/Vim/.vimrc
mkdir .emacs.d
cd ~/.emacs.d
wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/emacs/init.el
exit
cd

#Setup .bash_profile
echo 'source ~/.bashrc' >> ~/.bash_profile
echo 'echo -e "\n Disk capacity"' >> ~/.bash_profile
echo 'df -h' >> ~/.bash_profile
echo 'echo -e "\n"' >> ~/.bash_profile
echo 'screenfetch' >> ~/.bash_profile
echo 'echo -e "\n Users logged in at the same time"' >> ~/.bash_profile
echo 'w' >> ~/.bash_profile
echo 'echo -e "\n Confirming the Discord Bot"' >> ~/.bash_profile
echo 'ps ax | grep ruby' >> ~/.bash_profile

#Setup .bashrc
rm .bashrc
wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/bash/.bashrc
source ~/.bashrc
sudo su
cd
rm .bashrc
wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/bash/.bashrc
source ~/.bashrc
exit
cd

#SetupFile
mkdir script
echo 'export PATH="$HOME/script:$PATH"' >> ~/.bash_profile
cd script/
mkdir tmp
touch tmp/old_ip.txt
echo 'a' >> tmp/old_ip.txt
yes | sudo apt-get install mutt
wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/sh/mc
wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/sh/monit.sh
wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/sh/sendip
chmod +x monit.sh
chmod +x sendip
touch chruby
echo 'ps ax | grep ruby' >> chruby
chmod +x chmod
cd

#Apt-clean
sudo apt-get autoremove --purge
sudo apt-get clean

