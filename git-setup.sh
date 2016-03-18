#!/bin/bash
# setup git configs
git config --global user.name "Jacob Gersztyn"
git config --global user.email "jabocg@gmail.com"
git config --global push.default simple

if [ "$(uname)" == "Darwin" ]; then # Mac OS
    git config --global core.editor "mvim -v"
else 
    git config --global core.editor vim
fi
