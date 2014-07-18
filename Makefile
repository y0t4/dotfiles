all: tmux vim

tmux:
	ln -s -f ${PWD}/.tmux.conf ${HOME}/.tmux.conf

vim:
	ln -s -f ${PWD}/.vimrc ${HOME}/.vimrc
	ln -s -f ${PWD}/.vim ${HOME}/
