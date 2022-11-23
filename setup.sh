#!/bin/bash

# sudo apt update
# sudo apt install -y git

# git clone https://github.com/devin-jhu/dotfiles.git
# cd ./dotfiles && sh ./setup.sh
#
# update and upgrade system
echo Update and upgrade system
sudo apt-get update
sudo apt-get full-upgrade -y

sudo apt install tree

sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
# move back 1 directory
cd ..
# copy over NeoVim .config setup
cp -r ~/dotfiles/.config ~/

echo Load .bashrc file
> ~/.bashrc
cp ~/dotfiles/.bashrc ~/.bashrc

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
# the following is added tp .bashrc, but we need to run it here
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# now continue loading
nvm install node --lst
nvm install-latest-npm

# load java software
echo laod Java
sudo apt install default-jdk -y

# copy over shell script file
echo Load shell script files
mkdir ~/scripts
cp ~/dotfiles/java-lint.sh ~/scripts/java-lint.sh
sudo chmod +x ~/scripts/java-lint.sh

# loading checkstyle for java
# https://github.com/checkstyle/checks
# style/releases
echo load CheckStyle for Java
wget https://github.com/checkstyle/checkstyle/releases/download/checkstyle-10.3.3/checkstyle-10.3.3-all.jar
cp ./checkstyle-10.3.3-all.jar ~/scripts/checkstyle.jar
wget https://raw.githubusercontent.com/Mr-Coxall/dot_files/main/mr-coxall_checks.xml
cp ./mr-coxall_checks.xml ~/scripts/

# create folders structure
mkdir ~/ICS4U
mkdir ~/ICS4U/Unit1
mkdir ~/ICS4U/Unit1/Unit1-01
mkdir ~/ICS4U/Unit1/Unit1-02
mkdir ~/ICS4U/Unit1/Unit1-03
mkdir ~/ICS4U/Unit1/Unit1-04
mkdir ~/ICS4U/Unit1/Unit1-05
mkdir ~/ICS4U/Unit1/Unit1-06
mkdir ~/ICS4U/Unit2
mkdir ~/ICS4U/Unit2/Unit2-01
mkdir ~/ICS4U/Unit2/Unit2-02
mkdir ~/ICS4U/Unit2/Unit2-03
mkdir ~/ICS4U/Unit2/Unit2-04
mkdir ~/ICS4U/Unit2/Unit2-05
mkdir ~/ICS4U/Unit2/Unit2-06
mkdir ~/ICS4U/Unit2/Unit2-07
mkdir ~/ICS4U/Unit2/Unit2-08
mkdir ~/ICS4U/Unit2/Unit2-09
mkdir ~/ICS4U/Unit2/Unit2-10
mkdir ~/ICS4U/Unit3
mkdir ~/ICS4U/Unit3/Unit3-01
mkdir ~/ICS4U/Unit3/Unit3-02
mkdir ~/ICS4U/Unit3/Unit3-03
mkdir ~/ICS4U/Unit3/Unit3-04
mkdir ~/ICS4U/Unit3/Unit3-05

# Configure Git
git config --global user.email "devin.jhu@mths.ca"
git config --global user.name "devin-jhu"
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global fetch.prune true

# Setup GitHub SSH keys
echo "---------------------"
echo "Press RETURN 3 times."
ssh-keygen -t ed25519 -C "devin.jhu@mths.ca"
ssh-add ~/.ssh/id_ed25519
echo ""
cat ~/.ssh/id_ed25519.pub
echo "Please copy and paste the above key into your GitHub SSH Keys."
echo "(at: https://github.com/settings/keys)"
echo "Once done, press RETURN."
read  any_key
echo ""
echo "Next you will be asked if you want to continue"
echo "Type 'yes' ..."
echo "Once done, press any key."
read  any_key
ssh -T git@github.com

# load GitHub CLI
sudo apt install gh -y
gh auth login

# reboot
echo ---
echo rebooting now ...
echo ---
sudo reboot now
