#!/bin/bash
#
#setup comands cuz im lazy :)
#
echo Update and upgrade system
sudo apt-get update
sudo apt-get full-upgrade -y

#git time
git config --global user.email "devin.jhu@mths.ca"
git config --global user.name "devin-jhu"
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global fetch.prune true

#SSH shtuff
echo "--------------------"
echo "Press ENTER 3 times."
ssh-keygen -t ed25519 -C "devin.jhu@mths.ca"
ssh-add ~/.ssh/id_ed25519
echo ""
cat ~/.ssh/id_ed25519.pub
echo "paste that key ^ into github ssh then press ENTER when you sre done"
read any_key
echo ""
echo "type yes and press any key DO NOT OVERTHINK IT"
read any_key
ssh -T git@github.comands

#sum extra stuff to maka looka niceh
echo "Load programs"
sudo apt install tree
#neovim time
sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake get++ pkg-config unzip curl doxygen
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
#back it up
cd..

#tha lovely .bashrc makes an entrance
echo "load .bashrc file"
> ~/.bashrc
cp ~/dotfiles/.bashrc ~/.bashrc

#typescript
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
#typescript bashrc 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" #loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" #loads nvm bash completion
#back to reality 
nvm install node --lst
nvm install-latest-npm
#JAVA TIME
echo "load java"
sudo apt install default-jdk -y

# copy overshell script file
echo "Load shell script files"
mkdir ~/scripts
cp ~/dotfiles/