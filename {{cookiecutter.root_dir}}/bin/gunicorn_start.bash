#!/bin/bash
 
NAME="{{cookiecutter.project_name}}"            
DJANGODIR={{cookiecutter.deploy_fullpath_dir}}/{{cookiecutter.domain_name}}          
USER={{cookiecutter.webuser}}                                      
GROUP={{cookiecutter.group}}                                   
NUM_WORKERS=3                                   
DJANGO_SETTINGS_MODULE={{cookiecutter.project_name}}.settings.quick_prod                    
LOGDIR={{cookiecutter.deploy_fullpath_dir}}/{{cookiecutter.domain_name}}/log

echo "Starting $NAME as `whoami`"
 
# Activate the virtual environment
cd $DJANGODIR
source venv/bin/activate
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH


test -d $LOGDIR || mkdir -p $LOGDIR
 
# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
exec ../bin/gunicorn \
  --name $NAME \
  --workers $NUM_WORKERS \
  --bind=127.0.0.1:{{cookiecutter.gunicorn_port}} \
  --log-level=debug \
  --pythonpath=minibugsproj \
  wsgi:application
#    --log-file=- \  
#  --user=$USER --group=$GROUP \
