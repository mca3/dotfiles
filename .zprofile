export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"

export PS1="%(?..!%?)%(1j.&%j.)%# "
if [ -n "$SSH_CONNECTION" ]; then
	export PS1="%(?..!%?)%(1j.&%j.)%m%# "
fi
