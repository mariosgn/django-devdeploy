import os

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "{{cookiecutter.project_name}}.settings.prod")

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
 
