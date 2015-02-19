from os import environ
from dev import *
import socket

POSTGRESQL_DB_PORT = 5432

#if we are outside the vagrant machine, we need to go to a different port
if not "vagrant" in socket.gethostname():
    POSTGRESQL_DB_PORT = 15432

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': '{{cookiecutter.project_name}}',
        'USER': '{{cookiecutter.project_name}}',
        'PASSWORD': 'dbpass',
        'HOST': 'localhost',
        'PORT': POSTGRESQL_DB_PORT,
    }
}
