export ZSH="/home/wendy/.oh-my-zsh"
ZSH_THEME="avit"
export EDITOR="vim"
export QT_STYLE_OVERRIDE="kvantum"
export CONFIG_HOME="/home/wendy/.config"

plugins=(git)
source $ZSH/oh-my-zsh.sh

if which fasd >/dev/null; then
	fasd_cache="$HOME/.fasd-init-zsh"
	if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
		fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install >| "$fasd_cache"
	fi
	source "$fasd_cache"
	unset fasd_cache
fi

alias dl="cd ~/tmp"
alias l="ls -al"
alias ls="ls --color=auto"
alias x="python $HOME/bin/extract.py"

