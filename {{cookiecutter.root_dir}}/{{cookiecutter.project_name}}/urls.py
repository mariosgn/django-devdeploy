from django.conf.urls import patterns, include, url
from django.contrib import admin

admin.autodiscover()

urlpatterns = patterns('',
    url(r"^$", include('{{cookiecutter.project_name}}.apps.sample_{{cookiecutter.project_name}}.urls')),
    url(r'^admin/', include(admin.site.urls)),
)
