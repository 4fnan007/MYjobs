"""myjobs URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls import url,include
from temp import views
handler404 = 'temp.views.handler404'
urlpatterns = [
    path('admin/', admin.site.urls),
    url('application/', include('application.url')),
    # url('apply/', include('apply.url')),
    url('complaint/', include('complaint.url')),
    url('enquiry/', include('enquiry.url')),
    url('jobpost/', include('jobpost.url')),
    url('login/', include('login.url')),
    url('message/', include('message.url')),
    url('payment/', include('payment.url')),
    url('service/', include('service.url')),
    url('workers/', include('workers.url')),
    url('temp/',include('temp.url')),
    url('$',views.loginindex),

]