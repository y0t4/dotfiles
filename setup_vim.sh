#!/bin/sh

type git >/dev/null 2>&1 || ( echo "git command not found" && exit 1 )

curl -o ~/.vimrc https://raw.githubusercontent.com/yosukeota/dotfiles/master/.vimrc >/dev/null 2>&1 || echo "Could not download .vimrc"
[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle
[ ! -d ~/.vim/bundle/neobundle.vim ] && git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
[ ! -d ~/.vim/bundle/vimproc ] && git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc

echo "Please run this command: $ vim -c ':NeoBundleInstall'"
