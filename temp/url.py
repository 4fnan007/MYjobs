from django.conf.urls import url
from temp import views

urlpatterns=[
    url('admin_index/', views.adminhome),
    url('login_index/', views.loginindex),
    url('service_index/', views.service),
    url('worker_index/', views.worker),
    url('about_us/', views.about),
    url('usage/', views.usage),
    url('contact/', views.contact),

]