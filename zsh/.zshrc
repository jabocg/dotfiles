# Path to your oh-my-zsh installation.
# if [[ $(uname) == "Darwin" ]] ; then
#     export ZSH=/Users/jacob.gersztyn/.oh-my-zsh
# else
#     export ZSH=/home/jabocg/.oh-my-zsh
# fi
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="alanpeabody"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# add aws completer to path
plugins=(git brew gem httpie python web-search wd mvn)

# User configuration

if [[ $(uname) == "Darwin" ]] ; then
    plugins=(git brew gem httpie python web-search wd mvn)
    export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin:/usr/local/apache-maven-3.3.9/bin:$HOME/git/fzf/bin:$HOME/bin:/usr/local/apache-maven-3.3.9/bin:$HOME/Library/Android/sdk/platform-tools"
else
  plugins=(git gem httpie python web-search wd mvn)
  export PATH="$PATH:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:$HOME/bin:$HOME/git/fzf/bin:$HOME/bin:/opt/apache-maven/bin:"
fi

if [[ $(hostname) == "mako" ]] ; then
    export PATH="$PATH:/opt/blender"
fi

if [[ -e /opt/eclipse/eclipse ]] ; then
	export PATH="$PATH:/opt/eclipse/"
fi

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions

export EDITOR="nvim"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa_home
ssh-add ~/.ssh/id_rsa_school

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
if [[ $(uname) != 'Darwin' ]] ; then
    XDG_CONFIG_HOME=/Users/jacob.gersztyn/.config/
  . /usr/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
else
    XDG_CONFIG_HOME=/home/jabocg/.config/
  . /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi

# fzf integration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


# ----------------------------------------------------------------------------
# aliases 
# ----------------------------------------------------------------------------


if [[ `uname` == "Darwin" ]] ; then
    # Mac stuff
    #--------------------------------------------------------------------------
    # ls all, long, readable, colored, special markers
    # requires: coreutils
    alias ls="gls -Fv --color=auto --group-directories-first"
    alias la="gls -aFhlv --color=auto --time-style=long-iso"
    alias ll="gls -Fhlv --color=auto --time-style=long-iso"

    # using macvim
    alias vim="mvim -v"
    alias vimdiff='mvim -v -d'
    alias view='mvim -v -R'

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
# new venv
alias venv="source $VENV_PATH/activate"

# date in ISO8601 format
alias isodate="date +%f"

# vim notes with ISO date
alias vimnote="vim notes_$(isodate)"
alias vimnoted="vim notes_$(isodate).md"

# nuke alias, because funtimes
alias nuke='rm -rf'

# tree colored, ignore git, sort by name
alias tree='tree -I .git -c -C'

# ed alias, possibly useless but wfc
alias ed='ed -p:'

# alias to shutdown elcim
alias qeq='vim +ShutdownEclim +qa'

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
