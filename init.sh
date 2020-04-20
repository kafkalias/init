#!/bin/bash
cd

echo "[AK] Starting system initialization.."

echo "******************************************"
echo "***      REMINDER: UPDATE SUDOERS      ***"
echo "******************************************"


sudo apt update -y 
sudo apt upgrade -y 

sudo apt install wget git curl  -y 


echo "[AK] Create and fill 'scripts' folder"
    rm -rf ~/scripts
    mkdir ~/scripts
    cp -r init/scripts/* ~/scripts
    chmod +x ~/scripts/*

echo "[AK] Setting up ZSH"

sudo apt install git-core zsh -y  
sudo apt install powerline fonts-powerline -y 
sudo chsh -s $(which zsh)
wget --no-check-certificate http://install.ohmyz.sh -O - | sh

# sudo apt install zsh-theme-powerlevel9k



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

echo "[AK] Installing flameshot"
sudo apt install flameshot -y


echo "[AK] Installing snap"
sudo apt install snap

echo "[AK] Installing snapd"
sudo apt install snapd

echo "[AK] Installing slack"
sudo snap install slack --classic

echo "[AK] Installing vscode"
sudo snap install code --classic

echo "[AK] Installing spotify"
sudo snap install spotify



echo "[AK] Installing Java"
sudo apt install default-jdk -y 
update-alternatives --config java

echo "[AK] Installing SBT"
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823  
sudo apt update -y 
sudo apt install sbt -y 

echo "[AK] Installing Docker"
sudo apt update  -y 
sudo apt remove docker docker-engine docker.io -y 
sudo apt install docker.io -y 
sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker 

echo "[AK] Installing npm"
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install nodejs -y
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
npm install npm@latest -g  

sudo apt autoremove -y

rm ~/.zshrc
cp init/zshrc ~/.zshrc
source ~/.zshrc