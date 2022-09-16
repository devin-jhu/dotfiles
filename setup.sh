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
echo