# Path to your oh-my-zsh installation.
if [[ $(uname) == "Darwin" ]] ; then
    export ZSH=/Users/jacob.gersztyn/.oh-my-zsh
else
    export ZSH=/home/jabocg/.oh-my-zsh
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="random"

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
plugins=(git aws brew gem httpie python web-search wd)

# User configuration

if [[ $(uname) == "Darwin" ]] ; then
    export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/jacob.gersztyn/bin:/usr/local/apache-maven-3.3.9/bin:/Users/jacob.gersztyn/git/fzf/bin:/Users/jacob.gersztyn/bin:/usr/local/apache-maven-3.3.9/bin"
else
  export PATH="/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/jabocg/bin:/home/jabocg/git/fzf/bin:/home/jabocg/.local/bin:/home/jabocg/bin:/home/jabocg/bin:/home/jabocg/bin:/home/jabocg/.local/bin:/home/jabocg/bin"
fi
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim -v'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

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

# add some fzf functions

# fzim - call to call fzf, select file(s), edit
# will close on ESC out of fzf
fzim() {
    local files
    files=$(fzf-tmux -m) && echo "vim $files " && vim $files
}
# add alias with vim start
alias vimf='fzim'

# fd - call fzf, change to directory of selected file
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
# added alias with cd start
alias cdf='fd'

# ----------------------------------------------------------------------------
# aliases 
# ----------------------------------------------------------------------------


if [[ `uname` == "Darwin" ]] ; then
    # Mac stuff
    #--------------------------------------------------------------------------
    # ls all, long, readable, colored, special markers
    # requires: coreutils
    alias ls="gls -haFl --color=auto --time-style=long-iso"

    # add color to grep and tree
    alias grep="grep --color=always"

    # using macvim
    alias vim="mvim -v"

    # prevent launchctl from running in tmux
    if [[ $TERM == "screen-256color" ]] ; then
        alias launchctl="echo 'DO NOT RUN THIS INSIDE OF SCREEN OR TMUX'"
    fi
else
    # not Mac stuff

    # ls all, long, readable, special characters, color, iso date
    alias ls="ls -haFl --color=auto --time-style=long-iso"
fi

# python virtual evnironment
alias pve2="source ~/.venv/py2/bin/activate"
alias pve3="source ~/.venv/py3/bin/activate"

# date in ISO8601 format
alias isodate="date +%f"

# vim notes with ISO date
alias vimnote="vim notes_$(isodate)"
alias vimnoted="vim notes_$(isodate).md"

# nuke alias, because funtimes
alias nuke='rm -rf'

# tree colored, ginore git
alias tree='tree -I .git -c'

# ed alias, possibly useless but wfc
alias ed='ed -p:'

# alias to shutdown elcim
alias qeq='vim +ShutdownEclim +qa'