from django.conf.urls import url
from workers import views

urlpatterns=[
    url('viewworkers/', views.view_workers),
    url('post_worker/', views.post_worker),
    url('update_worker/(?P<idd>\w+)', views.post_worker_update),
    url('manageworker/', views.manage_worker),
    url('approve/(?P<idd>\w+)', views.approve),
    url('reject/(?P<idd>\w+)', views.reject)
]