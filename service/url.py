from django.conf.urls import url
from service import views

urlpatterns=[
    url('viewservice/', views.view_service),
    url('post_service/', views.post_service),
    url('post_service_update/(?P<idd>\w+)', views.post_service_update),
    url('manage_service/', views.manageservice ),
    url('appr/(?P<idd>\w+)', views.approve),
    url('rej/(?P<idd>\w+)', views.reject)
]