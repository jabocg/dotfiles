if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]] ; then
	source "${VIRTUAL_ENV}/bin/activate"
fi

if [[ -e /opt/pyenv ]] ; then
	export PYENV_ROOT=/opt/pyenv
elif [[ -e $HOME/.pyenv ]] ; then
	export PYENV_ROOT=$HOME/.pyenv
fi
