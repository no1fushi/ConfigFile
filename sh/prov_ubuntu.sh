#!/bin/bash

#Questions
echo "Will ask you a couple of questions first"
echo "Please answer yes or no"
echo "These questions are set to no by default"

echo "Will modify the files that think are necessary and install the software"
read -p "Do you allow it? [yes/no]: " do
if [ $do = "yes" ] || [ $do = "y" ] || [ $do = "YES" ] || [ $do = "Y" ] || [ $do = "Yes" ]; then

	read -p "Do you want ssh-keygen? [yes/no]: " ssh
	read -p "Do you want to install joke softwares? [yes/no]: " joke
	read -p "Do you need a script created by no1fushi? [yes/no]: " script

	echo "The question is finished"
	echo "So run the provisioning script"

#Apt
	yes | sudo apt-get update
	yes | sudo apt-get upgrade
	yes | sudo apt-get dist-upgrade
	yes | sudo apt-get update

	#ssh
	if [ $ssh = "yes" ] || [ $ssh = "y" ] || [ $ssh = "YES" ] || [ $ssh = "Y" ] || [ $ssh = "Yes" ]; then
		ssh-keygen -t rsa
		mv ~/id_rsa.pub ~/.ssh/authorized_keys
		chmod 600 ~/.ssh/authorized_keys
	fi

#Lang
	yes | sudo apt-get install gcc gauche
	yes | sudo apt-get install nodejs npm

#Editor
	yes | sudo apt-get install vim emacs24

#SetupEditor
	wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/Vim/.vimrc
	wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/emacs/init.el
	mkdir .emacs.d
	mv init.el ~/.emacs.d/

#Tool
	yes | sudo apt-get install tree curl traceroute
	yes | sudo apt-get install git
	yes | sudo apt-get install fortune
	yes | sudo apt-get install tmux

#Ruby
	yes | sudo apt-get install gcc autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
	sudo git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	sudo chmod a=rwx .rbenv
	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
	echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
	source .bash_profile
	sudo git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
	rbenv install 2.4.1
	rbenv rehash
	rbenv global 2.4.1

#RootMail
	yes | sudo apt-get install ssmtp sendmail-base

#Logwatch
	yes | sudo apt-get install logwatch

#Mongodb
	yes | sudo apt-get install g++ build-essential debian-keyring autoconf automake libtool flex bison scons git mongodb

#GemPackages
	yes | gem install discordrb gmail net-ping bigdecimal flumtter

#Joke
if [ $joke = "yes" ] || [ $joke = "y" ] || [ $joke = "YES" ] || [ $joke = "Y" ] || [ $joke = "Yes" ]; then
		yes | sudo apt-get install sl cowsay
		yes | gem install cureutils matsuya
		yes | gem install rubipara takarabako
		yes | sudo npm install -g faker-cli emspect
		yes | sudo apt-get install screenfetch
		echo 'screenfetch' >> ~/.bash_profile
fi

#Setup .bash_profile
	echo 'source ~/.bashrc' >> ~/.bash_profile
	echo 'echo -e "\n Disk capacity"' >> ~/.bash_profile
	echo 'df -h' >> ~/.bash_profile
	echo 'echo -e "\n"' >> ~/.bash_profile
	echo 'echo -e "\n Users logged in at the same time"' >> ~/.bash_profile
	echo 'w' >> ~/.bash_profile
#Setup .bashrc
	rm .bashrc
	wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/bash/.bashrc
	source ~/.bashrc

#SetupFile
	if [ $script = "yes" ] || [ $script = "y" ] || [ $script = "YES" ] || [ $script = "Y" ] || [ $script = "Yes" ]; then
		mkdir script
		echo 'export PATH="$HOME/script:$PATH"' >> ~/.bash_profile
		mkdir script/tmp/
		touch script/tmp/old_ip.txt
		echo 'a' >> script/tmp/old_ip.txt
		yes | sudo apt-get install mutt
		wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/sh/mc
		wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/sh/monit.sh
		wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/sh/sendip
		chmod +x monit.sh
		chmod +x sendip
		chmod +x mc
		mv monit.sh script/
		mv sendip script/
		mv mc script/
		touch script/chruby
		echo 'ps ax | grep ruby' >> script/chruby
		chmod +x script/chruby
	fi

	sudo cp .bash_profile /root/
	sudo cp .bashrc /root/
	sudo cp -r .emacs.d/ /root/
	sudo cp .vimrc /root/

#Apt-clean
	yes | sudo apt-get autoremove --purge
	yes | sudo apt-get clean

else
	exit
fi
