all: tmux vim zsh gitconfig

tmux:
	ln -s -f ${PWD}/.tmux.conf ${HOME}/.tmux.conf

vim: gitmodule
	ln -s -f ${PWD}/.vimrc ${HOME}/.vimrc
	ln -s -f ${PWD}/.vim ${HOME}

zsh:
	ln -s -f ${PWD}/.zshrc ${HOME}/.zshrc

gitmodule:
	git submodule init
	git submodule update

gitconfig:
	ln -s -f ${PWD}/.gitconfig ${HOME}/.gitconfig
