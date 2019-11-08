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
	yes | sudo apt update
	yes | sudo apt upgrade
	yes | sudo apt dist-upgrade
	yes | sudo apt update

# ssh
	if [ $ssh = "yes" ] || [ $ssh = "y" ] || [ $ssh = "YES" ] || [ $ssh = "Y" ] || [ $ssh = "Yes" ]; then
		ssh-keygen -t rsa
		mv ~/id_rsa.pub ~/.ssh/authorized_keys
		chmod 600 ~/.ssh/authorized_keys
	fi

# Lang
	yes | sudo apt install gcc gauche
	yes | sudo apt install nodejs npm
	yes | sudo apt install default-jre default-jdkc

# Editor
	yes | sudo apt install vim emacs24

# Tool
	yes | sudo apt install tree traceroute unzip fortune tmux
	yes | sudo apt install git wget curl

# SetupEditor
	rm .bashrc
	rm .bash_profile
	wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/Vim/.vimrc
	wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/emacs/init.el
	wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/bash/.bash_profile
	wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/bash/.bashrc
	mkdir .emacs.d
	mv init.el ~/.emacs.d/

# Ruby
	yes | sudo apt install gcc autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
	sudo git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	sudo chmod a=rwx .rbenv
	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
	echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
	source .bash_profile
	sudo git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
	rbenv install 2.4.1
	rbenv rehash
	rbenv global 2.4.1

# Python
	yes | sudo apt install -y build-essential libffi-dev libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev
	sudo git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
	echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
	echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
	source ~/.bash_profile
	pyenv install 3.8.0
	pyenv global 3.8.0

# Python packages
	pip install --upgrade pip
	pip install thefuck
	echo eval $(thefuck --alias) >> ~/.bash_profile
	echo eval $(thefuck --alias) >> ~/.bash_rc
	source ~/.bash_profile
	source ~/.bashrc
	pip install numpy pandas matplotlib

# RootMail
	yes | sudo apt install ssmtp sendmail-base

# Logwatch
	yes | sudo apt install logwatch

# Mongodb
	yes | sudo apt install g++ build-essential debian-keyring autoconf automake libtool flex bison scons git mongodb

# Joke
if [ $joke = "yes" ] || [ $joke = "y" ] || [ $joke = "YES" ] || [ $joke = "Y" ] || [ $joke = "Yes" ]; then
		yes | sudo apt install sl cowsay
		yes | gem install cureutils matsuya
		yes | gem install rubipara takarabako
		yes | sudo npm install -g faker-cli emspect
		yes | sudo apt install screenfetch
fi

#Setup .bashrc
	source ~/.bashrc
	source ~/.bash_profile
	sudo cp .bash_profile /root/
	sudo cp .bashrc /root/
	sudo cp -r .emacs.d/ /root/
	sudo cp .vimrc /root/

#Apt-clean
	yes | sudo apt autoremove --purge
	yes | sudo apt clean

else
	exit
fi

