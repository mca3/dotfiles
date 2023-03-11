export PATH="$HOME/.local/bin:$PATH"

export BROWSER="firefox-esr"
export EDITOR="nvim"
export TERMINAL="st"
export VISUAL="nvim"

# Move stuff out of ~
export GOPATH="$HOME/.local/share/go"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export GNUPGHOME="$HOME/.local/share/gnupg"
export HISTFILE="$HOME/.cache/zsh-history"

# Disable bad stuff from the Go toolchain
export GOPROXY=direct
export GOSUMDB=off
export GOTELEMETRY=off
export GOTOOLCHAIN=local

# %(?..!%?): display !errcode if errcode is set
# %(1j.%%j): display &jobs if there are any background tasks
export PS1="%(?..!%?)%(1j.&%j.)%# "
if [ -n "$SSH_CONNECTION" ]; then
	# Include hostname if over SSH
	export PS1="%m$PS1"
fi
