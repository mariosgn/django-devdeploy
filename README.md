django-devdeploy
=======================

Do not use: this stuff is heavily in development

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
    (base)$ cookiecutter https://github.com/mariosgn/django-devdeploy.git

Sources
-----
https://github.com/pydanny/cookiecutter-django
 
Sources TODO
-----
http://django-extensions.readthedocs.org/en/latest/jobs_scheduling.html 
https://github.com/torchbox/vagrant-django-template
https://github.com/pydanny/cookiecutter-djangopackage
https://medium.com/cs-math/2014-django-development-mistakes-in-2014-f48623f58b21 
