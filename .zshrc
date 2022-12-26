setopt autocd
stty stop undef

. $HOME/.config/aliases

alias ll="ls -l"
alias la="ls -a"

alias g="git"
alias ga="git add"
alias gc="git commit"
alias gca="git commit --amend"
alias gco="git checkout"
alias gd="git diff"
alias gp="git pull"
alias gs="git status"
alias gsw="git switch"
alias gP="git push"

alias d="git --work-tree=$HOME --git-dir=$HOME/.dotfiles"
alias da="d add"
alias dc="d commit"
alias dca="d commit --amend"
alias dco="d checkout"
alias ddf="d diff"
alias dp="d pull"
alias ds="d status"
alias dsw="d switch"
alias dP="d push"

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

bindkey -v
