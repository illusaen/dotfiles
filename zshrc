export ZSH="/home/wendy/.oh-my-zsh"
ZSH_THEME="refined"
export EDITOR="vim"
export QT_STYLE_OVERRIDE="kvantum"
export CONFIG_HOME="/home/wendy/.config"
export PATH="/home/wendy/bin:$PATH"

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
alias t="task"
alias ta="task add"
alias tn="task next"
alias tp="task +PERSONAL"
alias tm="task +ASAMUD"
alias tl="task list"
alias tco="task completed"
alias calc="task calc"

function td { yes | task $* done; }
function ts { task $* start; }
