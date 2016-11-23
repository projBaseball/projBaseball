from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.MainHomePage),
    url(r'^baseball/1/calculateRequest$', views.CalculateRequest),
]