#!/bin/sh -x
cd ~

mkdir .vim 2> /dev/null
let g:neosnippet#snippets_directory='~/.vim/snippets/'

rm .gitconfig
rm .gitignore_global
rm .gvimrc
rm .iterm2_shell_integration.zsh
rm .npmrc
rm .profile
rm .tmux.conf
rm .vimrc
rm .zprofile
rm .zshrc
rm -rf .dein

ln -s dotfiles/.gitconfig
ln -s dotfiles/.gitignore_global
ln -s dotfiles/.gvimrc
ln -s dotfiles/.iterm2_shell_integration.zsh
ln -s dotfiles/.npmrc
ln -s dotfiles/.profile
ln -s dotfiles/.tmux.conf
ln -s dotfiles/.vimrc
ln -s dotfiles/.zprofile
ln -s dotfiles/.zshrc
ln -s dotfiles/.dein
ln -s ../dotfiles/.vim/snippets .vim/snippets
