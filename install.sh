#!/bin/sh -x
cd ~

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/bundles

mkdir .vim 2> /dev/null

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
rm .vim/snippets

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
