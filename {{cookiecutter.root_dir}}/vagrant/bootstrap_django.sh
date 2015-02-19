#!/bin/bash

# Script to set up a Django project on Vagrant.
# Installation settings
PROJECT_NAME={{cookiecutter.project_name}}

VIRTUALENV_NAME=$PROJECT_NAME

PROJECT_DIR=/home/vagrant/$PROJECT_NAME
VIRTUALENV_DIR=/home/vagrant/virtualenv/$PROJECT_NAME
  
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

echo "export DJANGO_SETTINGS_MODULE='$PROJECT_NAME.settings.dev_postgres'" >> /home/vagrant/.bashrc

# Django project setup
su - vagrant -c "source $VIRTUALENV_DIR/bin/activate && cd $PROJECT_DIR &&  DJANGO_SETTINGS_MODULE='$PROJECT_NAME.settings.dev_postgres' ./manage.py syncdb --noinput && DJANGO_SETTINGS_MODULE='$PROJECT_NAME.settings.dev_postgres' ./manage.py migrate"

su - vagrant -c "chmod +x $PROJECT_DIR/vagrant/run_django_server.sh"
su - vagrant -c "sudo ln -s $PROJECT_DIR/vagrant/run_django_server.sh /usr/bin/run_django_server"
