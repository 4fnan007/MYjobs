from django.http import HttpResponseRedirect
from django.shortcuts import render
import datetime
from application.models import Application
from django.core.files.storage import FileSystemStorage
from workers.models import Worker
from jobpost.models import JobPost
# Create your views here.
def post_application(request,idd):
    ss=request.session["u_id"]
    obb=Worker.objects.all()
    obk=""
    if request.method=="POST":
        obj=Application()
        obj.jobpost_id=idd
        obj.worker_id=ss
        obj.apply_sts='applied'
        obj.status='pending'
        obj.name=request.POST.get('name')
        obj.place=request.POST.get('place')
        obj.phone_number=request.POST.get('contact')
        obj.date=datetime.datetime.today()
        obj.time=datetime.datetime.now()
        # obj.resume=request.POST.get('document')
        try:
            myfile = request.FILES['document']
            fs = FileSystemStorage()
            filename = fs.save(myfile.name, myfile)
            obj.resume = myfile.name
            obj.worker.profile=ss
        except:
            pass

        obj.save()

        obv=JobPost.objects.get(jobpost_id=idd)
        obv.status="Applied"
        obv.save()

        obk="Success"
    context = {
        'a': obb,
        'msg':obk
    }

    return render(request, 'application/post_application.html',context)
    return HttpResponseRedirect('/jobpost/manage/')

def view_worker_apply_status(request):
    ss=request.session["u_id"]
    obj=Application.objects.filter(jobpost__service_id=ss,status='Approved')
    context={
        'ab':obj
    }
    return render(request, 'application/view-worker_apply_status.html', context)

def view_admin_application(request):
    obj=Application.objects.all()
    context={
        'ac':obj
    }
    return render(request, 'application/view_admin_application.html', context)

def manage_application(request):
    ss=request.session["u_id"]
    obj=Application.objects.filter(jobpost__service_id=ss)
    print("User ID:", ss)
    print("Number of applications:", len(obj))
    context={
        'mng':obj
    }
    return render(request, 'application/manage_application.html', context)

def approve(request,idd):
    obb=Application.objects.get(application_id=idd)
    obb.status="Approved"
    obb.save()
    return manage_application(request)

def reject(request,idd):
    obb=Application.objects.get(application_id=idd)
    obb.status="Rejected"
    obb.save()
    return manage_application(request)

def worker_status(request):
    ss=request.session["u_id"]
    obj = Application.objects.filter(worker_id=ss)
    context = {
        'ws': obj
    }
    return render(request, 'application/worker_status.html', context)


def worker_history(request):
    ss=request.session["u_id"]
    obj = Application.objects.filter(worker_id=ss,status="Approved")
    context = {
        'ws': obj
    }
    return render(request, 'application/worker-history.html', context)
