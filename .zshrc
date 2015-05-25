# complement
autoload -U compinit
compinit
bindkey "[Z" reverse-menu-complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# lang
export LANG=ja_JP.UTF-8

# prompt

case ${UID} in
  0)
    RPROMPT="%B%{[37m%}%/#%{[m%}%b "
    PROMPT2="%B%{[37m%}%_#%{[m%}%b "
    SPROMPT="%B%{[37m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
  *)
    PROMPT="%{[37m%}%/%%%{[m%} "
    PROMPT2="%{[37m%}%_%%%{[m%} "
    SPROMPT="%{[37m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac

# terminal title
case "${TERM}" in
  kterm*|xterm*)
    precmd() {
      echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history
setopt extended_history

# no beep sound
setopt nolistbeep

# ls color
export LSCOLORS=Exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
alias ls="ls -G"
