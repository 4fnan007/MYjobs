from django.conf.urls import url
from payment import views

urlpatterns=[
    url('viewpayment/', views.view_payment),
    url('post_payment/(?P<idd>\w+)', views.post_payment),
    url('service_viewpay/', views.service_view_payment),
]