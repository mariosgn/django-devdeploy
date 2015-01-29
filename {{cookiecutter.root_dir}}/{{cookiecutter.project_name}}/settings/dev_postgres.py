
from os import environ
from dev import *


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'floodream',
        'USER': 'floodream',
        'PASSWORD': 'dbpass',
        'HOST': 'localhost',
        'PORT': '15432',
    }
}
