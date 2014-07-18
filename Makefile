all: tmux vim

tmux:
	ln -s -f ${PWD}/.tmux.conf ${HOME}/.tmux.conf

vim: gitmodule
	ln -s -f ${PWD}/.vimrc ${HOME}/.vimrc
	ln -s -f ${PWD}/.vim ${HOME}/

gitmodule:
	git submodule init
	git submodule update
