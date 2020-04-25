#!/bin/bash
cd

echo "[AK] Starting system initialization.."

echo "******************************************"
echo "***      REMINDER: UPDATE SUDOERS      ***"
echo "******************************************"


sudo apt update -y 
sudo apt upgrade -y 

sudo apt install wget git curl  -y 

echo "[AK] Create 'dev' folders"
    if [ ! -d ~/dev ]; 
        then
            mkdir -p ~/dev;
        else
            echo "'dev' folder exists"
    fi

echo "[AK] Create and fill 'scripts' folder"
    rm -rf ~/scripts
    mkdir ~/scripts
    cp -r init/scripts/* ~/scripts
    chmod +x ~/scripts/*

echo "[AK] Setting up ZSH"

rm -rf ~/.oh-my-zsh

sudo apt install zsh -y  
sudo apt install powerline fonts-powerline -y 
sudo chsh -s /bin/zsh root
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

echo "[AK] Installing zsh plugins"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

rm $HOME/.zshrc
cp init/zshrc $HOME/.zshrc
sleep 5


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

echo "[AK] Installing maven"
sudo apt install maven


echo "[AK] Installing npm and yarn"
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install nodejs -y 
sudo apt install gcc g++ make -y
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

source $HOME/.zshrc
sudo apt autoremove -y

