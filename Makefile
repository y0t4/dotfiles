all: tmux

tmux:
	ln -s -f ${pwd}/.tmux.conf ${HOME}/.tmux.conf
