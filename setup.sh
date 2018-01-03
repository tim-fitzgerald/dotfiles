#!/bin/bash

rm -r ~/.bashrc \
    ~/.bash_profile \
    ~/.aliases \
    ~/.functions \
    ~/.bash_prompt

ln -s ~/dotfiles/.bashrc ~/
ln -s ~/dotfiles/.bash_profile ~/
ln -s ~/dotfiles/.aliases ~/
ln -s ~/dotfiles/.functions ~/
ln -s ~/dotfiles/.bash_prompt ~/

source .bash_profile