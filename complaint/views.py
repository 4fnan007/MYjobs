from django.http import HttpResponseRedirect
from django.shortcuts import render
from complaint.models import Complaint
import datetime
from service.models import Service
from workers.models import Worker
# Create your views here.

def post_complaint(request):
    ss=request.session["u_id"]
    obj=Service.objects.all()
    context={
        's':obj
    }
    if request.method=="POST":
        obj=Complaint()
        obj.date=datetime.datetime.today()
        obj.time=datetime.datetime.now()
        obj.service_id=request.POST.get('service')
        obj.worker_id=ss
        obj.complaint_description=request.POST.get('complaint_description')
        obj.replay='pending'
        obj.worker.name='ss'
        obj.save()
    return render(request, 'complaint/post_complaint.html',context)

def view_complaint(request):
    ss = request.session["u_id"]
    obj=Complaint.objects.filter(service_id=ss)
    context={
        'cd':obj
    }
    return render(request, 'complaint/viewcomplaint.html',context)


def service_view_complaint_replay(request):
    obj=Complaint.objects.all()
    context={
        'svcr':obj
    }
    return render(request, 'complaint/service_view_complaint.html',context)


def user_view_complaint_replay(request):
    ss = request.session["u_id"]
    obj=Complaint.objects.filter(worker_id=ss)
    context={
        'svcr':obj
    }
    return render(request, 'complaint/user_view_complaint.html',context)


def post_service_complaint(request,idd):
    if request.method=="POST":
        obj=Complaint.objects.get(complaint_id=idd)
        obj.replay=request.POST.get('reply')
        obj.save()
        return HttpResponseRedirect('/complaint/viewcomplaint/')
    return render(request, 'complaint/post_service_complaint_replay.html')


