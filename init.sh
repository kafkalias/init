#!/bin/bash
cd

echo "[AK] Starting system initialization.."

echo "******************************************"
echo "***      REMINDER: UPDATE SUDOERS      ***"
echo "******************************************"


sudo apt -y update
sudo apt -y upgrade
sudo apt -y install wget git


echo "[AK] Create and fill 'scripts' folder"
    rm -rf ~/scripts
    mkdir ~/scripts
    cp -r init/scripts/* ~/scripts
    chmod +x ~/scripts/*

echo "[AK] Setting up ZSH"

sudo apt -y install zsh
sudo apt -y install powerline fonts-powerline
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
sudo chsh -s $(which zsh)

# sudo apt -y install zsh-theme-powerlevel9k

cp init/zshrc ~/.zshrc
source ~/.zshrc

echo "[AK] Installing zsh plugins"
 if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; 
        then
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
        else
            echo "'zsh-syntax-highlighting' exists"
    fi

 if [ ! -d ~/.oh-my-zsh/custom/themes/powerlevel9k ]; 
        then
            git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
        else
            echo "'powerlevel9k' exists"
    fi

 if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; 
        then
            git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
        else
            echo "'zsh-autosuggestions' exists"
    fi

echo "[AK] Create 'dev' folders"
    if [ ! -d ~/dev ]; 
        then
            mkdir -p ~/dev;
        else
            echo "'dev' folder exists"
    fi


echo "[AK] Installing snap"
sudo apt -y install snap

echo "[AK] Installing slack"
sudo snap install slack --classic

echo "[AK] Installing vscode"
sudo snap install code --classic

echo "[AK] Installing spotify"
sudo snap install spotify

echo "[AK] Installing Docker"
sudo apt update
sudo apt remove docker docker-engine docker.io
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker 

echo "[AK] Installing Java"
sudo apt -y install default-jdk
update-alternatives --config java

echo "[AK] Installing SBT"
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt -y update
sudo apt -y install sbt

