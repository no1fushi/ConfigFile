#!/bin/bash

#apt
yes | sudo apt-get update
yes | sudo apt-get upgrade

#lang
yes | sudo apt-get install gcc
yes | sudo apt-get install nodejs npm

#edit
yes | sudo apt-get install vim

#tool
yes | sudo apt-get install tree curl
yes | sudo apt-get install git
yes | sudo apt-get install fortune

#ruby
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
exec $SHELL -l
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install -v 2.2.2
rbenv rehash
rbenv global 2.2.2

#joke
yes | sudo apt-get install sl cowsay
yes | gem install cureutils matsuya
yes | gem install rubipara takarabako
yes | sudo npm install -g faker-cli emspect







