#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


#PULL DOWN DOTFILES
git clone https://github.com/joerocca/dotfiles.git ~/dotfiles


#ZSH

#zsh install
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -snf ~/dotfiles/.zshrc ~/.zshrc

#zplug install
#.zshrc file has install snippet
#curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh


#VIM

ln -snf ~/dotfiles/.vimrc ~/.vimrc

#vundle install
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall


#COCOAPODS

gem install cocoapods


#HOMEBREW

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#apps
brew cask install sublime-text
