#!/bin/sh
umask 022
chmod -R go-w `dirname $0`
cd ~

DEIN=~/.vim/bundles/repos/github.com/Shougo/dein.vim

if ! [ -e "$DEIN" ]; then
    git clone --depth 1 https://github.com/Shougo/dein.vim $DEIN
else
    git -C $DEIN pull
fi

if (type npm > /dev/null 2>&1); then
    npm completion > ~/.zshrc.npm
fi

rm .curlrc 2>/dev/null
rm .gitconfig 2>/dev/null
rm .gitignore_global 2>/dev/null
rm .gvimrc 2>/dev/null
rm .iterm2_shell_integration.zsh 2>/dev/null
rm .npmrc 2>/dev/null
rm .profile 2>/dev/null
rm .tmux.conf 2>/dev/null
rm .vimrc 2>/dev/null
rm .zprofile 2>/dev/null
rm .zshrc 2>/dev/null
rm -rf .dein 2>/dev/null
rm .vim/snippets 2>/dev/null
rm .vim/plugin 2>/dev/null
rm .ssh/config 2>/dev/null

ln -s dotfiles/.curlrc
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
ln -s ../dotfiles/.vim/plugin .vim/plugin
ln -s ../dotfiles/.ssh/config .ssh/config

chmod -R go-rwx .ssh
