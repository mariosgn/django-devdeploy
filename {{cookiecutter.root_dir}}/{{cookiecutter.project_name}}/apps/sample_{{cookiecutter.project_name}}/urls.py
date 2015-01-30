from django.conf.urls import patterns, include, url

from .views import HomeView

urlpatterns = patterns('',
    url('^$', HomeView.as_view(), name="sample_{{cookiecutter.project_name}}_home"),
)

