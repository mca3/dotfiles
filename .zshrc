setopt autocd
stty stop undef

. $HOME/.config/aliases

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

bindkey -v
