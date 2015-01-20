#!/bin/bash
set -x

APPNAME="{{cookiecutter.project_name}}"            # Name of the application
BASEDIR=/webapp
HOSTNAME='fd1.floodream.com'



DJANGODIR=$BASEDIR/$APPNAME                        # Django project directory
#SOCKFILE=unix:$BASEDIR/run/gunicorn.sock          # we will communicte using this unix socket
SOCKFILE=localhost:9000                            # we will communicte using this unix socket
USER=webuser                                       # the user to run as
GROUP=webapps                                      # the group to run as
NUM_WORKERS=3                                      # how many worker processes should Gunicorn spawn
DJANGO_SETTINGS_MODULE=$APPNAME.settings           # which settings file should Django use
#DJANGO_WSGI_MODULE=$APPNAME.wsgi                  # WSGI module name
DJANGO_WSGI_MODULE=wsgi
PYTHON_VIRTUAL_ENV=$BASEDIR/pvenv

echo "Starting $APPNAME as `whoami`"
 
# Activate the virtual environment
cd $BASEDIR 
source $PYTHON_VIRTUAL_ENV/bin/activate
#export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$BASEDIR:$DJANGODIR:$PYTHONPATH
export SECRET_KEY='mu7mzgqs&5@yfw&_9b_rr4x002c&hwfzqy&5(f)o*a&u_6a7zs'
export LOCAL_HOSTNAME=$HOSTNAME
 
# Create the run directory if it doesn't exist
#RUNDIR=$(dirname $SOCKFILE)
#test -d $RUNDIR || mkdir -p $RUNDIR
 
# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
exec $PYTHON_VIRTUAL_ENV/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \
  --name $APPNAME \
  --workers $NUM_WORKERS \
  --user=$USER --group=$GROUP \
  --log-level=debug \
  --bind=$SOCKFILE

