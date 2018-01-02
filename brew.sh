#!/usr/bin/env bash

brew update
brew upgrade

brew install coreutils

brew install moreutils

brew install findutils

brew install bash
brew install bash-completion2

if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

brew install git
brew install git-lfs
brew install imagemagick --with-webp

brew cleanup