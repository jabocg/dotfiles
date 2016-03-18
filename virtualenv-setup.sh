#!/bin/bash
# setup virtual environments

# install
pip install virtualenv

# create dir
mkdir -p ~/.venv/

# python2
virtualenv -p /usr/local/bin/python ~/.venv/py2/

# python3
virtualenv -p /usr/local/bin/python3 ~/.venv/py3/

# install ipython for both
source ~/.venv/py2/bin/activate
pip install ipython
deactivate 
source ~/.venv/py3/bin/activate
pip install ipython
deactivate
