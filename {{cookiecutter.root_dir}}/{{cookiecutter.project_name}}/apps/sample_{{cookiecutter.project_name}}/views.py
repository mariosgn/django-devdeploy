from django.views.generic.base import TemplateView

class HomeView(TemplateView):
    template_name = "sample_{{cookiecutter.project_name}}/base.html"
