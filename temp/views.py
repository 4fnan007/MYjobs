from django.shortcuts import render
from service.models import Service
from workers.models import Worker
from application.models import Application
from complaint.models import Complaint
from jobpost.models import JobPost
from django.db.models import Count
from django.utils import timezone
from django.template import RequestContext
# Create your views here.

def adminhome(request):
    # Counting for Service model
    service_count = Service.objects.count()
    service_pending_count = Service.objects.filter(status='pending').count()

    # Counting for Worker model
    worker_count = Worker.objects.count()
    worker_pending_count = Worker.objects.filter(status='pending').count()

    jobpost_count = JobPost.objects.count()

    # Counting for Application model
    application_count = Application.objects.count()

    # Counting for Complaint model
    complaint_count = Complaint.objects.count()

    context = {
        'service_count': service_count,
        'service_pending_count': service_pending_count,
        'jobpost_count': jobpost_count,
        'worker_count': worker_count,
        'worker_pending_count': worker_pending_count,
        'application_count': application_count,
        'complaint_count': complaint_count,
    }
    return render(request,'temp/admin.html', context)

def service(request):

    ss = request.session["u_id"]
    obj = Service.objects.get(service_id=ss)
    # Total count of job posts
    total_application = Application.objects.filter(jobpost__service_id=obj).count()
    pending_application = Application.objects.filter(jobpost__service_id=obj, status='pending').count()

    total_jobpost_count = JobPost.objects.filter(service=obj).count()
    all_jobpost = JobPost.objects.count()

    # Count of job posts made today
    today = timezone.now().date()
    today_jobpost_count = JobPost.objects.filter(service=obj, date=today).count()
    context = {
        'total_application': total_application,
        'pending_application': pending_application,
        'service_name': obj.service_name,
        'service_email': obj.email,
        'service_profile': obj.profile,
        'jobpost_total': total_jobpost_count,
        'jobpost_today': today_jobpost_count,
        'all_jobpost': all_jobpost,
        'p': obj
    }
    return render(request,'temp/service.html',context)

def worker(request):
    ss = request.session["u_id"]
    obj = Worker.objects.get(worker_id=ss)

    total_service = Service.objects.count()
    total_jobpost = JobPost.objects.count()
    total_application = Application.objects.filter(worker_id=obj).count()
    application_pending = Application.objects.filter(worker_id=obj, status='pending').count()
    application_approved = Application.objects.filter(worker_id=obj, status='approved').count()
    context = {
        'total_service': total_service,
        'total_jobpost': total_jobpost,
        'total_application': total_application,
        'worker_email':obj.email,
        'worker_name':obj.name,
        'worker_profile':obj.profile,
        'application_pending': application_pending,
        'application_approved': application_approved,
        'p': obj
    }
    return render(request,'temp/worker.html',context)

def loginindex(request):
    return render(request,'temp/loginindex.html')

def mservice(request): #----change
    ss = request.session["u_id"]
    obj = Service.objects.get(service_id=ss)
    context = {
        'service_profile': obj.profile,
        'p': obj
    }
    return render(request,'temp/mservice.html',context)

def handler404(request, exception):
    return render(request, "temp/404.html")

def about(request):
    return render(request,'temp/About.html')
def usage(request):
    return render(request,'temp/Usage.html')
def contact(request):
    return render(request,'temp/contact.html')
