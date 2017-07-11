#!/usr/bin/env python
import os
import sys
import pkgutil

if __name__ == "__main__":

    if not "DJANGO_SETTINGS_MODULE" in os.environ:
        print ("DJANGO_SETTINGS_MODULE is not set!")
        print ("Please select one:")
        
        setts = [name for _, name, _ in pkgutil.iter_modules(['{{cookiecutter.project_id}}/settings'])]
        for i, sett in enumerate(setts):
            print ( str(i) +": " +sett )

        s = input("Please select the desired configuration (default: 0): ")    
        
        try:
            s = int(s)
        except ValueError:
            s = 0
        
        settstr = "{{cookiecutter.project_id}}.settings.%s" % setts[s]
        os.environ.setdefault("DJANGO_SETTINGS_MODULE", settstr)
        
        print ('\033[31m\nRun the following line in your shell to avoid this question.\033[0m')
        print ('\033[32m export DJANGO_SETTINGS_MODULE=' + settstr + '\n\033[0m')
        os.environ.setdefault("DJANGO_SETTINGS_MODULE", settstr)

    try:
        from django.core.management import execute_from_command_line
    except ImportError:
        # The above import may fail for some other reason. Ensure that the
        # issue is really that Django is missing to avoid masking other
        # exceptions on Python 2.
        try:
            import django
        except ImportError:
            raise ImportError(
                "Couldn't import Django. Are you sure it's installed and "
                "available on your PYTHONPATH environment variable? Did you "
                "forget to activate a virtual environment?"
            )
        raise
    execute_from_command_line(sys.argv)
