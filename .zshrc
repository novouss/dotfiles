export ZSH="$HOME/.oh-my-zsh"

fpath+=($HOME/Documents/Repositories/pure)
autoload -U promptinit; promptinit
prompt pure

plugins=(
	git 
	sudo
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/plugins/sudo/sudo.plugin.zsh
source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias vi="nvim"
alias vim="nvim"

alias ll="ls -a"
alias ga="git add $1"
alias gs="git status"
alias cls="clear"
alias ff="fastfetch"
alias vnv="source .venv/bin/activate"
alias clock="watch -n 1 -t date"

# . "$HOME/.local/bin/env"
