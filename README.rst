django-devdeploy
=======================

Do not use: this stuff is heavily in development

Info
-----
I do not use virtualenvwrapper: it's already too easy to manage virtualenvs... there's not need to another layer.


Setup
-----
Install virtualenv_:

    $ pip install virtualenv

    or

    $ sudo apt-get install virtualenv

.. _virtualenv: https://virtualenv.pypa.io/en/latest/


Use it:

    $ virtualenv base

    $ source base/bin/activate
    
Install cookiecutter_:
.. _cookiecutter: https://github.com/audreyr/cookiecutter

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
