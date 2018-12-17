#!/bin/bash

rm -r ~/.bashrc > /dev/null 2>&1 
rm -r ~/.bash_profile > /dev/null 2>&1 
rm -r ~/.aliases > /dev/null 2>&1
rm -r ~/.functions > /dev/null 2>&1
rm -r ~/.bash_prompt > /dev/null 2>&1
rm -r ~/.zshrc > /dev/null 2>&1
rm -r ~/.tmux.conf > /dev/null 2>&1


ln -s ~/dotfiles/.bashrc ~/
ln -s ~/dotfiles/.bash_profile ~/
ln -s ~/dotfiles/.aliases ~/
ln -s ~/dotfiles/.functions ~/
ln -s ~/dotfiles/.bash_prompt ~/
ln -s ~/dotfiles/.zshrc ~/
ln -s ~/dotfiles/.tmux.conf ~/
ln -s ~/dotfiles/.tmux-powerlinerc ~/

source .bash_profile
