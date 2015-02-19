#!/usr/bin/env python
import os
import sys
import pkgutil

if __name__ == "__main__":
     if not "DJANGO_SETTINGS_MODULE" in os.environ:
        print "DJANGO_SETTINGS_MODULE is not set:"
        print "Please select one:"
        
        setts = [name for _, name, _ in pkgutil.iter_modules(['{{cookiecutter.project_name}}/settings'])]
        for i, sett in enumerate(setts):
            print "   %d: %s" % (i, sett)

        s = raw_input("Please select the desired configuration (default: 0): ")    
        
        try:
            s = int(s)
        except ValueError:
            s = 0
        
        settstr = "{{cookiecutter.project_name}}.settings.%s" % setts[s]
        os.environ.setdefault("DJANGO_SETTINGS_MODULE", settstr)
        
        print '\033[31m' +"\nRun the followind line in your shell to avoid this question." + '\033[0m'
        print '\033[32m' +"export DJANGO_SETTINGS_MODULE='%s'\n" % settstr + '\033[0m'
        os.environ.setdefault("DJANGO_SETTINGS_MODULE", settstr)

    from django.core.management import execute_from_command_line
    execute_from_command_line(sys.argv)
