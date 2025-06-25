#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export FZF_DEFAULT_COMMAND="find . -path "./.git" -prune -o -print"

# Enables the QT6 language server protocol
export PATH="/usr/lib/qt6/bin/:$PATH"

alias ls='ls --color=auto'
alias la='ls --color=auto -a'
alias ll='ls --color=auto -a -l'

alias grep='grep --color=auto'

alias vi='nvim'

function open() {
	nvim "$(fzf --walker=file)"
}

function goto() {
	cd "$(fzf --walker=dir)"
}

PS1='[\u@\h \W]\$ '
