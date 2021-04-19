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

autoload -Uz vcs_info

## BEGIN Prompt Setup 
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%r/%S:%b'

precmd() { vcs_info }

bat_filename=/sys/class/power_supply/BAT0/capacity

setopt PROMPT_SUBST
bat_text=
if [ -f $bat_filename ]
then
	if [ $(tput colors) = 256 ]
	then
		bat_text='BAT: $(cat $bat_filename | awk '\''{ if ( $1 > 50 ) { print "%F{154}"$1"%f" } else if ( $1 > 20 ){ print "%F{121}"$1"%f" } else { print "%F{196}"$1"%f" } }'\'') '
	else
	    bat_text='BAT : $(cat $bat_filename) '
	fi
fi

if [ $(tput colors) = 256 ]
then
	PROMPT="
$bat_text"'%F{196}%n%f@%F{154}%m%f %F{211}%~ %F{165}${vcs_info_msg_0_}%f
%F{137}>%f '
	else
	PROMPT='
TIME: %t 
%n@%m %~ > '
fi

function shot() {
	name="/tmp/shot-$(date +%Y-%m-%d-%H-%M).png"
	maim -s $name
	echo Written to $name
}

export GPG_TTY=$(tty)

## END Prompt Setup

alias ls=exa
alias veracrypt="veracrypt -t"
alias term='urxvtc -cd $(pwd)'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias clip='xclip -selection c'
alias ip='ip -brief -color'
alias grep='grep --color=auto'

# Space at end means keep aliasing
alias sudo='sudo '
alias please='sudo '

# Safety
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias cd='pushd'

cdls() { cd "$@" && ls; }

[[ -n "$ISLAPTOP" ]] && [[ "$TERM" == "linux" ]] &&  fbterm -- tmux

# Source an optional environment
[[ -n "$ZSH_SOURCE_ENV" ]] && source $ZSH_SOURCE_ENV
