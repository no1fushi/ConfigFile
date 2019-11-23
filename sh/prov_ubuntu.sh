#!/bin/bash

# Questions
echo "Will ask you a couple of questions first"
echo "Please answer yes or no"
echo "These questions are set to no by default"

echo "Will modify the files that think are necessary and install the software"
read -p "Do you allow it? [yes/no]: " do
if [ $do = "yes" ] || [ $do = "y" ] || [ $do = "YES" ] || [ $do = "Y" ] || [ $do = "Yes" ]; then

	read -p "Do you want ssh-keygen? [yes/no]: " ssh
	read -p "Do you want to install joke softwares? [yes/no]: " joke

	echo "The question is finished"
	echo "So run the provisioning script"

# Apt
	echo -e "\n\nApt up*\n\n"
	yes | sudo apt update
	yes | sudo apt upgrade
	yes | sudo apt dist-upgrade
	yes | sudo apt update
	echo -e "\n\n----------------------------Apt up* OK ----------------------------\n\n"

# Time
	echo -e "\n\nTime set*\n\n"
	yes | sudo apt install ntpdate
	sudo timedatectl set-timezone Asia/Tokyo
	sudo ntpdate -v ntp.nict.jp
	echo -e "\n\n----------------------------Time set OK ----------------------------\n\n"

# ssh
	if [ $ssh = "yes" ] || [ $ssh = "y" ] || [ $ssh = "YES" ] || [ $ssh = "Y" ] || [ $ssh = "Yes" ]; then
		echo -e "\n\nSSHKKeygen\n\n"
		ssh-keygen -t rsa
		mv ~/id_rsa.pub ~/.ssh/authorized_keys
		chmod 600 ~/.ssh/authorized_keys
		echo -e "\n\n----------------------------SSH-Keygen OK ----------------------------\n\n"
	fi

# Lang

	echo -e "\n\nPrograming lang install\n\n"
	yes | sudo apt install gcc gauche
	yes | sudo apt install default-jre default-jdk
	echo -e "\n\n----------------------------Programing lang install OK ----------------------------\n\n"

# Editor
	echo -e "\n\nEditor install\n\n"
	yes | sudo apt install emacs24 nano
	echo -e "\n\n----------------------------Editor install OK ----------------------------\n\n"

# vim
	echo -e "\n\nVim install\n\n"
	yes | sudo apt install  ncurses-dev lua5.2 lua5.2-dev luajit python-dev python3-dev ruby-dev build-dep
	sudo sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
	sudo apt build-dep vim
	cd /opt/
	cd vim/
	sudo ./configure --with-features=huge --enable-gui=auto --enable-gtk2-check --with-x --enable-multibyte --enable-luainterp=dynamic --enable-gpm --enable-cscope --enable-fontset --enable-fail-if-missing --prefix=/usr/local --enable-pythoninterp=dynamic --enable-python3interp=dynamic --enable-rubyinterp=dynamic
	sudo make
	sudo make install
	cd
	echo -e "\n\n----------------------------Vim install OK ----------------------------\n\n"

# Tools
	echo -e "\n\nTools install\n\n"
	yes | sudo apt install tree traceroute unzip fortune tmux
	yes | sudo apt install git wget curl openssh-server
	yes | sudo apt install sed grep jq
	echo -e "\n\n----------------------------Tools install OK ----------------------------\n\n"

# DotFiles set
	echo -e "\n\nDotFiles set\n\n"
	rm .bashrc
	rm .bash_profile
	wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/vim/.vimrc
	wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/emacs/init.el
	wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/bash/.bash_profile
	wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/bash/.bashrc
	mkdir .emacs.d
	mv init.el ~/.emacs.d/
	echo -e "\n\n----------------------------DotFiles set OK ----------------------------\n\n"

# Ruby
	echo -e "\n\nRuby install\n\n"
	yes | sudo apt install gcc autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
	sudo git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	sudo chmod a=rwx .rbenv
	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
	echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
	source .bash_profile
	sudo git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
	ruby=$(rbenv install -l | grep -v - | tail -1)
	rbenv install $ruby
	rbenv global $ruby
	rbenv rehash
	echo -e "\n\n----------------------------Ruby install OK ----------------------------\n\n"

# Python
	echo -e "\n\nPython install\n\n"
	yes | sudo apt install -y libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev
	sudo git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	sudo chmod a=rwx .pyenv
	echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
	echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
	echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
	source ~/.bash_profile
	python3=$(pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s3\.?*' | tail -1)
	sudo pyenv install $python3
	pyenv global $python3
	pyenv rehash
	echo -e "\n\n----------------------------Python install OK ----------------------------\n\n"

# Python packages
	echo -e"\n\nPython packages install\n\n"
	sudo pip install --upgrade pip setuptools
	sudo pip install ez-setup
	git clone https://github.com/Zulko/unroll
	pip install ./unroll
	sudo rm -rf unroll/
	sudo pip install thefuck
	echo eval $(thefuck --alias) >> ~/.bash_profile
	echo eval $(thefuck --alias) >> ~/.bashrc
	source ~/.bash_profile
	source ~/.bashrc
	sudo pip install numpy pandas matplotlib
	echo -e "\n\n----------------------------Python packages install OK ----------------------------\n\n"

# Mecab
	echo -e"\n\nMecab install\n\n"
	yes | sudo apt install mecab libmecab-dev mecab-ipadic-utf8
	git clone https://github.com/neologd/mecab-ipadic-neologd.git
	cd mecab-ipadic-neologd
	echo yes | sudo bin/install-mecab-ipadic-neologd
	cd
	sudo rm -rf mecab-ipadic-neologd/
	sudo pip install mecab
	echo -e "\n\n----------------------------Mecab install OK ----------------------------\n\n"

# Nodejs
	echo -e "\n\nNode.js install\n\n"
	yes | sudo apt install nodejs npm
	sudo npm install n -g
	sudo n stable
	yes | sudo apt purge nodejs npm
	echo -e "\n\n----------------------------Node.js install OK ----------------------------\n\n"

# Node.js packages
	echo -e"\n\nNode.js packages install\n\n"
	npm install -D webpack webpack-cli babel-loader @babel/core @babel/preset-env
	echo -e "\n\n----------------------------Node.js packages install OK ----------------------------\n\n"

# RootMail
	echo -e "\n\nMail tools install\n\n"
	yes | sudo apt install ssmtp sendmail-base
	echo -e "\n\n----------------------------Mail tools install OK ----------------------------\n\n"

# Logwatch
	echo -e "\n\nLogwatch install\n\n"
	yes | sudo apt install logwatch
	echo -e "\n\n----------------------------Logwatch install OK ----------------------------\n\n"

# Mongodb
	yes | sudo apt install g++ debian-keyring autoconf automake libtool flex bison scons git mongodb

# Joke
	if [ $joke = "yes" ] || [ $joke = "y" ] || [ $joke = "YES" ] || [ $joke = "Y" ] || [ $joke = "Yes" ]; then
		echo -e "\n\nJoke softs install\n\n"
		yes | sudo apt install sl cowsay
		yes | gem install cureutils matsuya
		yes | gem install rubipara takarabako
		yes | sudo npm install -g faker-cli emspect
		yes | sudo apt install screenfetch
		echo -e "\n\n----------------------------Joke softs install OK ----------------------------\n\n"
	fi

# Setup .files
	echo -e "\n\nDotFiles set root\n\n"
	source ~/.bashrc
	source ~/.bash_profile
	sudo cp .bash_profile /root/
	sudo cp .bashrc /root/
	sudo cp -r .emacs.d/ /root/
	sudo cp .vimrc /root/
	echo -e "\n\n----------------------------DotFiles set root OK ----------------------------\n\n"

# Apt clean
	echo -e "\n\nApt clean\n\n"
	yes | sudo apt autoremove --purge
	yes | sudo apt clean
	echo -e "\n\n----------------------------Apt clean OK ----------------------------\n\n"
else
	exit
fi

