export PATH="$HOME/.local/bin:$PATH"

export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"

# %(?..!%?): display !errcode if errcode is set
# %(1j.%%j): display &jobs if there are any background tasks
export PS1="%(?..!%?)%(1j.&%j.)%# "
if [ -n "$SSH_CONNECTION" ]; then
	# Include hostname if over SSH
	export PS1="%(?..!%?)%(1j.&%j.)%m%# "
fi
