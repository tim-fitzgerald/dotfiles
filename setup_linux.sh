#!/bin/bash

#Google repository
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

#VSCode Repository
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

#Update and Install. 
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install -y vim git gksudo google-chrome-stable code pip 

#Use snap for spotify
snap install spotify

#Install awscli
pip install awscli --upgrade --user

#Install Golang
wget https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.10.3.linux-amd64.tar.gz
mkdir -p ~/go/{src, bin, pkg}

echo "export PATH=$PATH:/usr/local/go/bin" >> .bash_profile
echo "export PATH=$PATH:$(go env GOPATH)/bin" >> .bash_profile
echo "export GOPATH=$(go env GOPATH)" >> .bash_profile

