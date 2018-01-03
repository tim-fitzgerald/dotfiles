#!/bin/bash

rm -r ~/.bashrc
rm -r ~/.bash_profile
rm -r ~/.aliases
rm -r ~/.functions
rm -r ~/.bash_prompt

ln -s ~/dotfiles/.bashrc ~/
ln -s ~/dotfiles/.bash_profile ~/
ln -s ~/dotfiles/.aliases ~/
ln -s ~/dotfiles/.functions ~/
ln -s ~/dotfiles/.bash_prompt ~/

source .bash_profile