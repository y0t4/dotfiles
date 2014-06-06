#!/bin/sh

type git >/dev/null 2>&1 || ( echo '\033[31mgit: command not found\033[0m' && exit 1 ) || exit 1
type ctags >/dev/null 2>&1 || echo '\033[31mctags: command not found\033[0m'

echo 'You should install exuberant ctags.'
echo 'Run following command.'
echo 'Mac:    \033[33m$ brew install ctags\033[0m'
echo '     or \033[33m$ port install ctags\033[0m'
echo 'RedHat: \033[33m$ yum install ctags\033[0m'
echo 'Debian: \033[33m$ apt-get install ctags\033[0m'

curl -o ~/.vimrc https://raw.githubusercontent.com/yosukeota/dotfiles/master/.vimrc >/dev/null 2>&1 || ( echo '\033[31mCould not download .vimrc\033[0m' && exit 1 ) || exit 1

[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle
[ -d ~/.vim/bundle/neobundle.vim ] && echo '\n~/.vim/bundle/neobundle.vim is already exist.' || git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim >/dev/null 2>&1 || echo '\033[31mgit clone failed\033[0m'

echo '\nPlease run following command: \033[33m$ vim -c ':NeoBundleInstall'\033[0m'