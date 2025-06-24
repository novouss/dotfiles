#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export FZF_DEFAULT_COMMAND="find . -path "./.git" -prune -o -print"

alias ls='ls --color=auto'
alias la='ls --color=auto -a'

alias grep='grep --color=auto'

alias vi='nvim'

function open() {
	nvim "$(fzf --walker=file)"
}

function goto() {
	cd "$(fzf --walker=dir)"
}

PS1='[\u@\h \W]\$ '
