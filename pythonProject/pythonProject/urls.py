"""pythonProject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
import helloworld

urlpatterns = [
    #django study
    url(r'^admin/', admin.site.urls),
    url(r'^polls/', include('polls.urls')),
    #url(r'^$', helloworld.RenderShortcut),
    url(r'^blog/', include('blog.urls')),
    url(r'', include('baseball.urls')),


    #django test
    url(r'^hello/$', helloworld.hello),
    url(r'^Smoothie/1/BackEndMessagingTest/SendMessage/$', helloworld.helloworldTest),
    url(r'^Smoothie/1/DjangoTest/$', helloworld.globalVarTest),
    url(r'^Add/$', helloworld.Add),
    url(r'^Sum/$', helloworld.Sum),
    url(r'^StaticTester/$', helloworld.staticTester),

]
