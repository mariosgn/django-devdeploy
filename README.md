django-devdeploy
=======================

Do not use: this stuff is heavily in development an completely not ready.

Info
-----
I do not use virtualenvwrapper: it's already too easy to manage virtualenvs... there's not need to another layer.


Setup
-----
Install virtualenv (https://virtualenv.pypa.io/en/latest/) :

    $ pip install virtualenv
    $ sudo apt-get install virtualenv

and then use it:

    $ virtualenv virtenv
    Running virtualenv with interpreter /usr/bin/python2
    New python executable in base/bin/python2
    Also creating executable in base/bin/python
    Installing setuptools, pip...done.
    $ source virtenv/bin/activate
    (virtenv)$

Now install cookiecutter (https://github.com/audreyr/cookiecutter).

You may need python-dev:
    
    (virtenv)$ apt-get install python-dev
    (virtenv)$ pip install cookiecutter

Then run it on this repo and answer to its questions:

    (virtenv)$ cookiecutter https://github.com/mariosgn/django-devdeploy.git
    Cloning into 'django-devdeploy'...
    remote: Counting objects: 48, done.
    remote: Compressing objects: 100% (41/41), done.
    remote: Total 48 (delta 12), reused 31 (delta 2)
    Unpacking objects: 100% (48/48), done.
    Checking connectivity... fatto.
    project_name (default is "project_name")? mydjangoapp
    author_name (default is "Your Name")? Mario Signorino
    email (default is "Your email")? mario.signorino@mydjango.app           
    domain_name (default is "example.com")? www.mydjango.app
    root_dir (default is "webapps")?      
    (virtenv)$
    
Now you should have a new django app in a directory called *webapps*. Go into it:

    cd mydjangoapp
    
Install the needed python packages    

    (virtenv)$ pip install -r requirements/dev_host.txt
    (virtenv)$ ./manage.py syncdb
    DJANGO_SETTINGS_MODULE is not set:
    Please select one:
       0: common
       1: dev
       2: dev_postgres
       3: prod
       4: quick_prod
    Please select the desired configuration (default: 0): 1
    
    Run the followind line in your shell to avoid this question.
    export DJANGO_SETTINGS_MODULE='mydjangoapp.settings.dev'
    [....]
    (virtenv)$ export DJANGO_SETTINGS_MODULE='mydjangoapp.settings.dev'
    (virtenv)$ ./manage.py runserver



Sources
-----
https://github.com/pydanny/cookiecutter-django
 
Sources TODO
-----
http://django-extensions.readthedocs.org/en/latest/jobs_scheduling.html 
https://github.com/torchbox/vagrant-django-template
https://github.com/pydanny/cookiecutter-djangopackage
https://medium.com/cs-math/2014-django-development-mistakes-in-2014-f48623f58b21 
