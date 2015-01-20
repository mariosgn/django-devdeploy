from django.conf.urls import patterns, include, url
from django.contrib import admin

from libs.pages.views import HomepageView, SiteInitView

admin.autodiscover()

urlpatterns = patterns('',
    url(r'^siteinit/', SiteInitView.as_view(), name="site_init" ),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^i18n/', include('django.conf.urls.i18n')),
    url(r"^accounts/", include("apps.vfaccount.urls")),
    url(r"^backend/", include("apps.vfbackend.urls")),
    url(r"^test/", include("apps.vftest.urls") ),
    url('^$', HomepageView.as_view(), name="site_home"),
    url(r'^rosetta/', include('rosetta.urls')),
)
