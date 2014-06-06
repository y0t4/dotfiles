#!/bin/sh

type git >/dev/null 2>&1 || ( echo "git: command not found" && exit 1 )
type ctags >/dev/null 2>&1 || ( echo "ctags: command not found" && exit 1 )
echo "If you use Mac, you should install exuberant ctags."
echo "Run following command."
echo "$ brew install ctags"

curl -o ~/.vimrc https://raw.githubusercontent.com/yosukeota/dotfiles/master/.vimrc >/dev/null 2>&1 || ( echo "Could not download .vimrc" && exit 1 )
[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle
[ ! -d ~/.vim/bundle/neobundle.vim ] && git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim >/dev/null 2>&1 || ( echo "failed git clone neobundle.vim." && exit 1 )

echo "\nPlease run following command: $ vim -c ':NeoBundleInstall'"
