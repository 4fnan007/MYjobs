from django.conf.urls import url
from jobpost import views

urlpatterns=[
    url('view/', views.view_jobpost),
    url('jobpost/', views.post_jobpost),
    url('manage/', views.manage),
    url('delete/(?P<idd>\w+)', views.delete),
    url('dt/(?P<idd>\w+)', views.dele),
    url('svp/',views.view_jobpost_s),
    url('apply/(?P<idd>\w+)', views.apply),
    url('view_pay/', views.view_pay),
    url('service_viewjobs/', views.serviceview)
]