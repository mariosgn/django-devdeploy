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

and then use it (in bash):

    $ virtualenv base
    Running virtualenv with interpreter /usr/bin/python2
    New python executable in base/bin/python2
    Also creating executable in base/bin/python
    Installing setuptools, pip...done.
    $ source base/bin/activate
    (base)$

Now install cookiecutter (https://github.com/audreyr/cookiecutter):

    (base)$ pip install cookiecutter

Then run it on this repo and answer to its questions:

    (base)$ cookiecutter https://github.com/mariosgn/django-devdeploy.git
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
    (base)$
    
Now you should have a new django app in a directory called *webapps*.


Sources
-----
https://github.com/pydanny/cookiecutter-django
 
Sources TODO
-----
http://django-extensions.readthedocs.org/en/latest/jobs_scheduling.html 
https://github.com/torchbox/vagrant-django-template
https://github.com/pydanny/cookiecutter-djangopackage
https://medium.com/cs-math/2014-django-development-mistakes-in-2014-f48623f58b21 
