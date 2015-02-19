#!/bin/bash

# Script to set up a Django project on Vagrant.

# Installation settings
PROJECT_NAME=$1

DB_NAME=$PROJECT_NAME
VIRTUALENV_NAME=$PROJECT_NAME
PROJECT_DIR=/home/vagrant/$PROJECT_NAME
VAGRANT_SCRIPTS_DIR=$PROJECT_DIR/vagrant


# Install essential packages from apt and set up some common things
apt-get update -y
chmod +x $VAGRANT_SCRIPTS_DIR/*.sh

#install postgres
$VAGRANT_SCRIPTS_DIR/bootstrap_postgres.sh

#install django
$VAGRANT_SCRIPTS_DIR/bootstrap_django.sh

