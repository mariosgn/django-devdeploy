#!/bin/bash

echo "Creating virtualenv at {{cookiecutter.fullpath_dir}}{{cookiecutter.root_dir}}"
virtualenv {{cookiecutter.deploy_fullpath_dir}}/{{cookiecutter.root_dir}}/venv
source {{cookiecutter.deploy_fullpath_dir}}/{{cookiecutter.root_dir}}/venv/bin/activate

echo "Installing django base..."
pip install -r {{cookiecutter.deploy_fullpath_dir}}/{{cookiecutter.root_dir}}/requirements/prod.txt

echo "To enter the virtualenv write:"
echo "source {{cookiecutter.deploy_fullpath_dir}}/{{cookiecutter.root_dir}}/venv/bin/activate"
