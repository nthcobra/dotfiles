#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null

alias ls='ls --color=auto'
alias i3config='vim ~/.config/i3/config'
alias xbindkeys='killall xbindkeys; xbindkeys'
alias sudo='sudo '

export PATH="$PATH:/bin/playerctl"
#export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="$PATH:/home/arch/scripts"

PS1="\[\e[48;5;24m\]\h \[\e[m\]\[\e[48;5;239m\] \W \$ \[\e[m\] "
#PS1="\[\e[48;5;24m\]\u@\h \[\e[m\]\[\e[48;5;239m\] \W \$ \[\e[m\] "
#PS1="\[\e[48;5;196m\]\u@\h \[\e[m\]\[\e[48;5;239m\] \W \$ \[\e[m\] "

#enable vim mode for bash
set -o vi

shopt -s histappend
shopt -s checkwinsize
HISTSIZE=5000

export HISTCONTROL=ignoreboth

#screenfetch
#if [ -f /usr/bin/neofetch ]; then neofetch; cal; fi

#functions
cl() {
	local dir="$1"
	local dir="${dir:=$HOME}"
	if [[ -d "$dir" ]]; then
		cd "$dir" >/dev/null; ls
	else
		echo "bash: cl: $dir: Directory not found"
	fi
}

