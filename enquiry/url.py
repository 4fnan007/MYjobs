from django.conf.urls import url
from enquiry import views

urlpatterns=[
    url('viewenquiry/',views.view_enquiry),
    url('post_enquiry/',views.post_enquiry),
    url('view_replay/',views.view_replay),
    url('post_enq_replay/(?P<idd>\w+)',views.post_enquiry_replay)
]