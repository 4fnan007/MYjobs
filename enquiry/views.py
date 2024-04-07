from django.shortcuts import render
from enquiry.models import Enquiry
import datetime
from service.models import Service
# Create your views here.


def post_enquiry(request):
    ss=request.session["u_id"]
    obj=Service.objects.all()
    context={
        'sd':obj
    }
    if request.method=="POST":
        obj=Enquiry()
        obj.enquiry=request.POST.get('enquiry')
        obj.service_id=request.POST.get("service")
        obj.worker_id=ss
        obj.date=datetime.datetime.today()
        obj.time=datetime.datetime.now()
        obj.replay="Pending"
        obj.save()
    return render(request, 'enquiry/post_enquiry.html', context)

def view_enquiry(request):
    ss = request.session["u_id"]
    obj = Enquiry.objects.filter(service_id=ss)
    context = {
        'c': obj
    }
    return render(request, 'enquiry/view_enquiry.html',context)



def post_enquiry_replay(request,idd):
    if request.method=="POST":
        obj=Enquiry.objects.get(enquiry_id=idd)
        obj.replay=request.POST.get('replay_description')
        obj.save()
        return view_enquiry(request)
    return render(request, 'enquiry/post-enq_replay.html')


def view_replay(request):
    obj = Enquiry.objects.all()
    context = {
        'ca': obj
    }
    return render(request, 'enquiry/viewreplay.html', context)