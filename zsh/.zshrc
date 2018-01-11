# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="alanpeabody"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"


# User configuration

# Path configuration
if [[ -z "$TMUX" ]] ; then
	PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:$HOME/bin:/bin:/sbin"

	if [[ $(uname) == "Darwin" ]] ; then
		PATH="$PATH:/usr/local/apache-maven-3.3.9/bin:/usr/local/apache-maven-3.3.9/bin:"
	else
		PATH="$PATH:$HOME/bin:/opt/apache-maven/bin:"
	fi

	# FZF path setup
	if [[ -e $HOME/git/fzf/ ]] ; then
		PATH="$PATH:$HOME/git/fzf/bin"
	fi

	# Blender path setup
	if [[ -e /opt/blender ]] ; then
		PATH="$PATH:/opt/blender"
	fi

	# Eclipse path setup
	if [[ -e /opt/eclipse/eclipse ]] ; then
		PATH="$PATH:/opt/eclipse"
	fi

	# Android Studio path setup
	if [[ -e /opt/android-studio/bin/studio.sh ]] ; then
		PATH="$PATH:/opt/android-studio/bin"
	fi

	# Pyenv path setup
	if [[ -e $HOME/.pyenv/ ]] ; then
		PATH="$PATH:$HOME/.pyenv/bin"
	fi

	# Keychain path setup
	if [[ -e /opt/keychain/ ]] ; then
		PATH="$PATH:/opt/keychain/"
		eval $(keychain --eval id_rsa id_rsa_home id_rsa_work)
	elif [[ -e /usr/local/bin/keychain ]] ; then
		PATH="$PATH:/usr/local/bin/keychain/"
		eval $(keychain --eval id_rsa id_rsa_home id_rsa_work)
	elif hash keychain 2>/dev/null ; then
		eval $(keychain --eval id_rsa id_rsa_home id_rsa_work)
	else
		eval $(ssh-agent)
		ssh-add $HOME/.ssh/id_rsa_home
		ssh-add $HOME/.ssh/id_rsa_work
	fi

	export PATH
fi

if [[ $(uname) == "Darwin" ]] ; then
	plugins=(git brew gem httpie python web-search wd mvn zsh-syntax-highlighting)
else
	plugins=(git gem httpie python web-search wd mvn zsh-syntax-highlighting)
fi



source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR="nvim"
export VISUAL="nvim"

# Preferred terminal: gnome-terminal
export TERMINAL="gnome-terminal"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export TERM="xterm-256color"

# powerline setup
XDG_CONFIG_HOME="/home/$USER/.config/"
. /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

# fzf integration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


# ----------------------------------------------------------------------------
# aliases
# ----------------------------------------------------------------------------


if [[ $(uname) == "Darwin" ]] ; then
	# Mac stuff
	#--------------------------------------------------------------------------
	# ls all, long, readable, colored, special markers
	# requires: coreutils
	alias ls="gls -Fv --color=auto --group-directories-first"
	alias la="gls -aFhlv --color=auto --time-style=long-iso --group-directories-first"
	alias ll="gls -Fhlv --color=auto --time-style=long-iso --group-directories-first"

	# prevent launchctl from running in tmux
	if [[ $TERM == "screen-256color" ]] ; then
		alias launchctl="echo 'DO NOT RUN THIS INSIDE OF SCREEN OR TMUX'"
	fi

	# use coreutils echo
	alias echo="gecho"

else
	# not Mac stuff

	# ls all, long, readable, special characters, color, iso date
	alias ls="ls -Fv --color=auto --group-directories-first"
	alias ll="ls -hFlv --color=auto --time-style=long-iso"
	alias la="ls -aFhlv --color=auto --time-style=long-iso"
fi

# add color to grep and tree
alias grep="grep --color=always"

# python virtual evnironment
alias pv2="source $HOME/.venv/py2/bin/activate"
alias pv3="source $HOME/.venv/py3/bin/activate"

# pyenv
if hash pyenv 2>/dev/null ; then
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
	export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi

# nuke alias, because funtimes
alias nuke='rm -rf'

# tree colored, ignore git, sort by name
alias tree='tree -I .git -c -C'

# ed alias, possibly useless but wfc
alias ed='ed -p:'

# git aliases
alias grc='git rebase --continue'
alias grs='git rebase --skip'
alias gpl='git pull '
alias gplv='git pull --verbose'
alias gl='git log'
alias glv='git log -u'
alias gpsu='git push --set-upstream origin'
alias gc='git commit'
alias gcv='git commit --verbose'
alias gca='git commit --all'
alias gcav='git commit --verbose --all'
alias gwt='git worktree'
alias glg="git log --all --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short --graph"

# disable cd'ing into a directory via name alone
unsetopt AUTO_CD

# source alias
alias so='source'

# lessing ls with color
alias lss='la --color=always | less'

alias nvimin="nvim $HOME/.config/nvim/init.vim"

# view .ssh/config stuff
alias ssh-config="cat $HOME/.ssh/config"


################
#              #
#  Python Misc #
#              #
################
#
alias ipython="ipython --no-confirm-exit"
alias ipython2="ipython2 --no-confirm-exit"
alias ipython3="ipython3 --no-confirm-exit"

pip() {
	if [[ -n $VIRTUAL_ENV ]] ; then
		# if in a virtualenv, use vevn pip
		command pip $@
	else
		# use pip 2
		_pip 2 $@
	fi
}

pip2() {
	_pip 2 $@
}

pip3() {
	_pip 3 $@
}

_pip() {
	pipver=$1
	shift

	if [[ "$1" == "install" ]] ; then
		# install packages as user by default
		shift
		command pip$pipver install --user $@
	else if [[ "$1" == "list" ]] ; then
		# list in column format
			command pip$pipver list --format=columns $@
		else if [[ "$1" == "global" ]] ; then
				shift
				command pip$pipver install $@
						else
				command pip$pipver $@
			fi
		fi
	fi
}
