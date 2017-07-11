#!/bin/bash

PROJECT_NAME={{cookiecutter.project_id}}

VIRTUALENV_NAME=$PROJECT_NAME

PROJECT_DIR=/home/vagrant/$PROJECT_NAME
VIRTUALENV_DIR=/home/vagrant/virtualenv/$PROJECT_NAME

echo 
echo  -e "\e[31mRemember to point on http://127.0.0.1:8111/ and not on 8000\e[0m" 
echo 

export DJANGO_SETTINGS_MODULE="$PROJECT_NAME.settings.dev_postgres"

source $VIRTUALENV_DIR/bin/activate 
cd $PROJECT_DIR 
./manage.py runserver 0.0.0.0:8000
