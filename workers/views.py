
from login.models import Login

# Create your views here.
from django.core.files.storage import FileSystemStorage

from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.core.files.storage import FileSystemStorage
from django.db.models import Q
from .models import Worker

def post_worker(request):
    # obk=""
    context = {}
    if request.method == "POST":
        a = request.POST.get('number')
        b = request.POST.get('un')
        obv = Worker.objects.filter(Q(email=b) & (Q(phone_number=a)) | (Q(email=b)) | (Q(phone_number=a)))
        if len(obv) > 0:
            obl="user"
            print("user exist")
        else:
            print("Registered")
            obj = Worker()
            obj.name = request.POST.get('nm')
            obj.email = request.POST.get('un')
            obj.password = request.POST.get('ps')
            obj.city = request.POST.get('city')
            obj.location = request.POST.get('location')
            obj.pin = request.POST.get('pin')
            obj.amount = request.POST.get('upi')
            obj.phone_number = request.POST.get('number')

        try:
            myfile = request.FILES['ooo']
            fs = FileSystemStorage()
            filename = fs.save(myfile.name, myfile)
            obj.profile = myfile.name

        except:
            pass
            obj.status = 'pending'
            obj.save()

            # obk = "ss"  # This is not used anywhere

        # context['msg'] = True
        #  Add 'msg' to the context dictionary
        # context={
        #     'msg':obk,
        #     'vv':obl
        # }
            # Redirect after successful registration
        return HttpResponseRedirect('/login/login/')
    return render(request, 'workers/post_worker.html',context)


def view_workers(request):
    ss=request.session["u_id"]
    obj = Worker.objects.filter(worker_id=ss)
    context = {
        'j': obj
    }
    return render(request, 'workers/viewworkers.html',context)

def post_worker_update(request,idd):
    obb=Worker.objects.get(worker_id=idd)
    context={
        'a':obb
    }
    if request.method=="POST":
        obj=Worker.objects.get(worker_id=idd)
        obj.name = request.POST.get('nm')
        obj.email=request.POST.get('un')
        obj.city=request.POST.get('city')
        obj.location=request.POST.get('location')
        obj.pin=request.POST.get('pin')
        obj.amount=request.POST.get('upi')
        obj.phone_number=request.POST.get('number')
        # obj.profile=request.POST.get('profile_document')
        try:
            myfile = request.FILES['profile_document']
            fs = FileSystemStorage()
            filename = fs.save(myfile.name, myfile)
            obj.profile = myfile.name
        except:
            pass

        obj.status = 'pending'
        obj.password=request.POST.get('ps')
        obj.save()

        ob=Login.objects.get(u_id=idd,type='worker')
        ob.username=obj.email
        ob.password=obj.password
        ob.save()


        return view_workers(request)
    return render(request, 'workers/post-update_worker.html',context)

def manage_worker(request):
    obj = Worker.objects.all()
    approved_count = Worker.objects.filter(status='Approved').count()
    rejected_count = Worker.objects.filter(status='Rejected').count()
    pending_count = Worker.objects.filter(status='pending').count()
    total_workers = Worker.objects.count()

    context = {
        'mw': obj,
        'approved_count': approved_count,
        'rejected_count': rejected_count,
        'pending_count': pending_count,
        'total_workers': total_workers,
    }
    return render(request, 'workers/manage_worker.html',context)

def approve(request,idd):
    a = request.POST.get('number')
    b = request.POST.get('un')
    obv = Worker.objects.filter(Q(email=b) & (Q(phone_number=a)) | (Q(email=b)) | (Q(phone_number=a)))
    if len(obv) > 0:
        print("user exist")
    else:
        obb=Worker.objects.get(worker_id=idd)
        obb.status="Approved"
        obb.save()

        obj = Login()
        obj.username = obb.email
        obj.password = obb.password
        obj.type = "worker"
        obj.u_id = obb.worker_id
        obj.save()
        return manage_worker(request)

def reject(request,idd):
    obb=Worker.objects.get(worker_id=idd)
    obb.status="Rejected"
    obb.save()
    ulog=Login.objects.filter(u_id=idd,type="worker")
    if len(ulog)>0:
        ulog[0].delete()
    return manage_worker(request)

