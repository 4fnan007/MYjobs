from django.conf.urls import url
from complaint import views

urlpatterns=[
    url('viewcomplaint/', views.view_complaint),
    url('post_complaint/', views.post_complaint),
    url('service_view_complaint/', views.service_view_complaint_replay),
    url('post_service_complaint/(?P<idd>\w+)', views.post_service_complaint),
    url('uvc/',views.user_view_complaint_replay)
]