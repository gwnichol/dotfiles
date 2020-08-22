# .zshrc for gwnichol

[[ -f ~/.profile ]] && source ~/.profile

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd
unsetopt beep

bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

autoload -Uz promptinit
promptinit

## BEGIN Prompt Setup 

bat_filename=/sys/class/power_supply/BAT0/capacity

setopt PROMPT_SUBST
if [ -f $bat_filename ]
then
	if [ $TERM = "screen-256color" ] || [ $TERM = "rxvt-unicode-256color" ]
	then
	PROMPT='
BAT: $(cat $bat_filename | awk '\''{ if ( $1 > 50 ) { print "%F{154}"$1"%f" } else if ( $1 > 20 ){ print "%F{121}"$1"%f" } else { print "%F{196}"$1"%f" } }'\'') ($(cat $bat_filename))| TIME:%F{214m}%t%f
%F{196}%n%f@%F{154}%m%f %F{211}%~%f
%F{137}>%f '
	else
	PROMPT='
BAT : $(cat $bat_filename) | TIME: %t 
%n@%m %~ > '
	fi
else
	if [ $TERM = "screen-256color" ] || [ $TERM = "rxvt-unicode-256color" ]
	then
	PROMPT='
TIME:%F{214m}%t%f
%F{196}%n%f@%F{154}%m%f %F{211}%~%f
%F{137}>%f '
	else
	PROMPT='
TIME: %t 
%n@%m %~ > '
	fi
fi

## END Prompt Setup

alias ls=exa
alias veracrypt="veracrypt -t"
alias term='urxvtc -cd $(pwd)'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

#[ -n "$FBTERM" ] && export TERM
[[ -n "$ISLAPTOP" ]] && [[ "$TERM" == "linux" ]] &&  fbterm -- tmux
[[ "$TERM" == "rxvt-unicode-256color" ]] && export TERM=xterm-256color
