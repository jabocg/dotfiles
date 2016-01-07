# .bashrc
# add to home dir '~'

# force color terminal
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

# reminder to kill softwareupdate process
if [ $(uname -s) == 'Darwin' -a $TERM != 'screen-256color' ] ; then
    echo "KILL KILL KILL softwareupdate KILL KILL KILL"
    echo "KILL KILL KILL softwareupdate KILL KILL KILL"
    echo "KILL KILL KILL softwareupdate KILL KILL KILL"
    echo "KILL KILL KILL softwareupdate KILL KILL KILL"
    echo "KILL KILL KILL softwareupdate KILL KILL KILL"
    echo "KILL KILL KILL softwareupdate KILL KILL KILL"
fi

# set the special Raspberry Pi colors ONLY IF it is a pi via hostname
if [ "$color_prompt" = yes -a $HOSTNAME == "raspberrypi" ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
elif [ "$(uname)" == "Darwin" ]; then
    # stuff to do with Mac
    PS1='\e[0;33m[\!]\e[m \u@\H \e[0;36m\W\e[m $ '
else
    # else set to custom coloring
    # PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    # PS1='\[\e[0m\][\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;36m\]\h \[\e[0;37m\]\W\[\e[0m\]]\[\e[0m\]\$ '
    echo
fi
unset color_prompt force_color_prompt


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# load .bash_aliases if it exists
if [ -e ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# set env settings
export EDITOR=vim

# A shortcut function that simplifies usage of xclip.
# - Accepts input from either stdin (pipe), or params.
# ------------------------------------------------
cb() {
  local _scs_col="\e[0;32m"; local _wrn_col='\e[1;31m'; local _trn_col='\e[0;33m'
  # Check that xclip is installed.
  if ! type xclip > /dev/null 2>&1; then
    echo -e "$_wrn_col""You must have the 'xclip' program installed.\e[0m"
  # Check user is not root (root doesn't have access to user xorg server)
  elif [[ "$USER" == "root" ]]; then
    echo -e "$_wrn_col""Must be regular user (not root) to copy a file to the clipboard.\e[0m"
  else
    # If no tty, data should be available on stdin
    if ! [[ "$( tty )" == /dev/* ]]; then
      input="$(< /dev/stdin)"
    # Else, fetch input from params
    else
      input="$*"
    fi
    if [ -z "$input" ]; then  # If no input, print usage message.
      echo "Copies a string to the clipboard."
      echo "Usage: cb <string>"
      echo "       echo <string> | cb"
    else
      # Copy input to clipboard
      echo -n "$input" | xclip -selection c
      # Truncate text for status
      if [ ${#input} -gt 80 ]; then input="$(echo $input | cut -c1-80)$_trn_col...\e[0m"; fi
      # Print status.
      echo -e "$_scs_col""Copied to clipboard:\e[0m $input"
    fi
  fi
}
# Aliases / functions leveraging the cb() function
# ------------------------------------------------
# Copy contents of a file
function cbf() { cat "$1" | cb; }  
# Copy SSH public key
alias cbssh="cbf ~/.ssh/id_rsa.pub"  
# Copy current working directory
alias cbwd="pwd | cb"  
# Copy most recent command in bash history
alias cbhs="cat $HISTFILE | tail -n 1 | cb"  

## ADD USER STUFF BELOW THIS LINE ##

# stuff for powerline
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  if [ $(uname) != 'Darwin' ] ; then
      . /usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
  else
      . /Library/Python/2.7/site-packages/powerline/bindings/bash/powerline.sh
  fi
fi

# add ~/bin to path
export PATH=$PATH:~/bin/

# stuff for mac
if [ $(uname) == 'Darwin' ] ; then
    export PATH=$PATH:/usr/local/apache-maven-3.3.9/bin
    export ECLIPSE_HOME=~/Applications/Eclipse.app/Contents/Eclipse/
else
    export PATH=$PATH:
    export ECLIPSE_HOME=~/eclipse
    export POWERLINE=/usr/lib/python2.7/site-packages/powerline/
fi

# fzf intergration
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# add some fzf functions

# fzim - call to call fzf, select file(s), edit
# will close on ESC out of fzf
fzim() {
    local files
    files=$(fzf-tmux -m) && echo "vim $files " && vim $files
}

# fd - call fzf, change to directory of selected file
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
# added alias with cd start
alias cdf='fd'

