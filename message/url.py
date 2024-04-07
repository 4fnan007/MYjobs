from django.conf.urls import url
from message import views

urlpatterns=[
    url('viewmessage/', views.view_message),
    url('post_msg/', views.post_msg)
]