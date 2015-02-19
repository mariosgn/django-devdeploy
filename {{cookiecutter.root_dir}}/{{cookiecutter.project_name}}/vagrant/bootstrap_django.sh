#!/bin/bash

# Script to set up a Django project on Vagrant.
# Installation settings
PROJECT_NAME={{cookiecutter.project_name}}

VIRTUALENV_NAME=$PROJECT_NAME

PROJECT_DIR=/home/vagrant/$PROJECT_NAME
VIRTUALENV_DIR=/home/vagrant/virtualenv/$PROJECT_NAME
LOCAL_SETTINGS_PATH="/$PROJECT_NAME/settings/local.py"

PGSQL_VERSION=9.3

# Python dev packages
apt-get install -y build-essential python python-dev

# Dependencies for image processing with Pillow (drop-in replacement for PIL)
# supporting: jpeg, tiff, png, freetype, littlecms
# (pip install pillow to get pillow itself, it is not in requirements.txt)
apt-get install -y python-virtualenv python-setuptools libjpeg-dev libtiff-dev zlib1g-dev libfreetype6-dev liblcms2-dev
# Git (we'd rather avoid people keeping credentials for git commits in the repo, but sometimes we need it for pip requirements that aren't in PyPI)
apt-get install -y git

# virtualenv setup for project
su - vagrant -c "virtualenv $VIRTUALENV_DIR" 
su - vagrant -c "source $VIRTUALENV_DIR/bin/activate && pip install -r $PROJECT_DIR/requirements/dev_vagrant.txt"  

# Django project setup
su - vagrant -c "source $VIRTUALENV_DIR/bin/activate && cd $PROJECT_DIR && ./manage.py syncdb --noinput && ./manage.py migrate"
