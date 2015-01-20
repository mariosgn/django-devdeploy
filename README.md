django-devdeploy
=======================

Do not use: this stuff is development

 $ virtualenv base
 $ source base/bin/activate
 (base)$ pip install cookiecutter
 (base)$ cookiecutter https://github.com/mariosgn/django-devdeploy
 

Sources:
https://github.com/pydanny/cookiecutter-django
 
Sources TODO:
http://django-extensions.readthedocs.org/en/latest/jobs_scheduling.html 
https://github.com/torchbox/vagrant-django-template
https://github.com/pydanny/cookiecutter-djangopackage
https://medium.com/cs-math/2014-django-development-mistakes-in-2014-f48623f58b21
 
 
A template for new Django 1.7 projects developed under Vagrant. Features offered include:

* A Vagrantfile for building an Ubuntu Trusty based VM
* A virtualenv (configured to be active on login), with project dependencies managed through a requirements.txt file
* A PostgreSQL database (with the same name as the project, pre-configured in the project settings file)
* Separation of configuration settings into base.py, dev.py and production.py (and optionally local.py, kept outside
  of version control) as per http://www.sparklewise.com/django-settings-for-production-and-development-best-practices/
* South, django-devserver, django-compressor, django-debug-toolbar out of the box
* A boilerplate base template with jquery included, and various other ideas and best practices borrowed from https://github.com/h5bp/html5-boilerplate

Setup
-----
Install Django 1.7 on your host machine. (Be sure to explicitly uninstall earlier versions first, or use a virtualenv -
having earlier versions around seems to cause pre-1.4-style settings.py and urls.py files to be generated alongside the
new ones.)

To start a new project, run the following commands:

    django-admin.py startproject --template https://github.com/torchbox/vagrant-django-template/zipball/master --name=Vagrantfile myproject
    cd myproject
    vagrant up
    vagrant ssh
      (then, within the SSH session:)
    ./manage.py runserver 0.0.0.0:8000

This will make the app accessible on the host machine as http://localhost:8111/ . The codebase is located on the host
machine, exported to the VM as a shared folder; code editing and Git operations will generally be done on the host.

See also
--------
https://github.com/torchbox/vagrant-django-base - a recipe for a Vagrant base box that can be used in place of precise32
in the Vagrantfile - this has more of the server setup baked in, so that we can save time by not having to re-run those
steps every time we create a new VM instance.
