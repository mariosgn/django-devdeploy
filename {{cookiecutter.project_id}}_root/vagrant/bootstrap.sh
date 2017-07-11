#!/bin/bash

# Script to set up a Django project on Vagrant.

# default value for $1 is: "{{cookiecutter.project_id}}"
# exec as: 
# ./bootstrap.sh "{{cookiecutter.project_id}}"


# Installation settings
PROJECT_ID=$1

DB_NAME=$PROJECT_ID
VIRTUALENV_NAME=$PROJECT_ID
PROJECT_DIR=/home/vagrant/$PROJECT_ID
VAGRANT_SCRIPTS_DIR=$PROJECT_DIR/vagrant


# Install essential packages from apt and set up some common things
apt-get update -y
chmod +x $VAGRANT_SCRIPTS_DIR/*.sh

# install postgres
#$VAGRANT_SCRIPTS_DIR/bootstrap_postgres.sh

# install django
#$VAGRANT_SCRIPTS_DIR/bootstrap_django.sh

