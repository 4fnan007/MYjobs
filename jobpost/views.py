from django.shortcuts import render
from jobpost.models import JobPost
import datetime
# Create your views here.



def post_jobpost(request):
    ss=request.session["u_id"]
    if request.method=="POST":
        obj=JobPost()
        obj.service_id=ss
        obj.job_post=request.POST.get('job_name')
        obj.date=datetime.datetime.today()
        obj.time=datetime.datetime.now()
        obj.description=request.POST.get('description')
        obj.status=("pending")
        obj.date=datetime.datetime.today()
        obj.time=datetime.datetime.now()
        obj.save()
    return render(request, 'jobpost/jobpost.html')


def view_jobpost_s(request):
    ss = request.session["u_id"]
    obj=JobPost.objects.filter(service_id=ss)
    context = {
        'mj': obj #----change
    }
    return render(request, 'jobpost/smanagejobpost.html', context)

def dele(request,idd):
    obb=JobPost.objects.get(jobpost_id=idd)
    obb.delete()
    return view_jobpost_s(request)

def view_jobpost(request):
    obj=JobPost.objects.all()
    context = {
        'mj': obj
    }
    return render(request, 'jobpost/managejobpost.html', context)

def manage(request):
    # ss = request.session["u_id"]
    # obj=JobPost.objects.filter(application__worker_id=ss)
    obj=JobPost.objects.all()
    context = {
        'd': obj
    }
    return render(request, 'jobpost/viewjobpost.html', context)

def delete(request,idd):
    obb=JobPost.objects.get(jobpost_id=idd)
    obb.delete()
    return view_jobpost(request)

def apply(request,idd):
     obb=JobPost.objects.get(jobpost_id=idd)
     obb.status="Apply"
     obb.save()
     return manage(request)

def view_pay(request):
    ss = request.session["u_id"]
    obj=JobPost.objects.filter(status='Apply',application__worker_id=ss)
    context = {
        'mj': obj
    }
    return render(request, 'jobpost/payment.html', context)

def serviceview(request):
    # ss = request.session["u_id"]
    # obj=JobPost.objects.filter(application__worker_id=ss)
    obj=JobPost.objects.all()
    context = {
        'd': obj
    }
    return render(request, 'jobpost/serviceviewjobpost.html', context)