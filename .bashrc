#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export FZF_DEFAULT_COMMAND="find . -path "./.git" -prune -o -print"

alias grep='grep --color=auto'

alias vi='nvim'

function open() {
	nvim "fd | $(fzf --walker=file)"
}

function goto() {
	cd "fd | $(fzf --walker=dir)"
}

PS1='[\u@\h \W]\$ '
