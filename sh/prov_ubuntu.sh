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

# ssh
	if [ $ssh = "yes" ] || [ $ssh = "y" ] || [ $ssh = "YES" ] || [ $ssh = "Y" ] || [ $ssh = "Yes" ]; then
		ssh-keygen -t rsa
		mv ~/id_rsa.pub ~/.ssh/authorized_keys
		chmod 600 ~/.ssh/authorized_keys
	fi

# Lang

	echo -e "\n\nPrograming lang install\n\n"
	yes | sudo apt install gcc gauche
	yes | sudo apt install nodejs npm
	yes | sudo apt install default-jre default-jdkc
	echo -e "\n\n----------------------------Programing lang install OK ----------------------------\n\n"

# Editor
	echo -e "\n\nEditor install\n\n"
	yes | sudo apt install vim emacs24
	echo -e "\n\n----------------------------Editor install OK ----------------------------\n\n"

# Tools
	echo -e "\n\nTools install\n\n"
	yes | sudo apt install tree traceroute unzip fortune tmux
	yes | sudo apt install git wget curl
	echo -e "\n\n----------------------------Tools install OK ----------------------------\n\n"

# SetupEditor
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
	rbenv install 2.4.1
	rbenv rehash
	rbenv global 2.4.1
	echo -e "\n\n----------------------------Ruby install OK ----------------------------\n\n"

# Python
	echo -e "\n\nPython install\n\n"
	yes | sudo apt install -y build-essential libffi-dev libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev
	sudo git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
	echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
	echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
	source ~/.bash_profile
	sudo pyenv install 3.8.0
	pyenv global 3.8.0
	echo -e "\n\n----------------------------Python install OK ----------------------------\n\n"

# Python packages
	echo -e"\n\nPython packages install\n\n"
	pip install --upgrade pip
	pip install thefuck
	echo eval $(thefuck --alias) >> ~/.bash_profile
	echo eval $(thefuck --alias) >> ~/.bashrc
	source ~/.bash_profile
	source ~/.bashrc
	pip install numpy pandas matplotlib
	echo -e "\n\n----------------------------Python packages install OK ----------------------------\n\n"

# RootMail
	echo -e "\n\nMail tools install\n\n"
	yes | sudo apt install ssmtp sendmail-base
	echo -e "\n\n----------------------------Mail tools install OK ----------------------------\n\n"

# Logwatch
	echo -e "\n\nLogwatch install\n\n"
	yes | sudo apt install logwatch
	echo -e "\n\n----------------------------Logwatch install OK ----------------------------\n\n"

# Mongodb
	yes | sudo apt install g++ build-essential debian-keyring autoconf automake libtool flex bison scons git mongodb

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

