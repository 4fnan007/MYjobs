from django.conf.urls import url
from application import views

urlpatterns=[

    url('postapplication/(?P<idd>\w+)', views.post_application),
    url('view_worker_apply_status/', views.view_worker_apply_status),
    url('view_admin_application/', views.view_admin_application),
    url('manage_application/', views.manage_application),
    url('approve/(?P<idd>\w+)',views.approve),
    url('reject/(?P<idd>\w+)',views.reject),
    url('worker_sts/',views.worker_status),
    url('history/',views.worker_history)
]