from django.http import HttpResponseRedirect
from django.core.files.storage import FileSystemStorage
from django.shortcuts import render
from service.models import Service
from login.models import Login
from django.contrib import messages
# from django.db.models import Q


# Create your views here.


def post_service(request):
    if request.method == "POST":
        a = request.POST.get('contact')
        b = request.POST.get('un')
        obv=Service.objects.filter(email=b,contact=a)
        # obv = Service.objects.filter(Q(email=b) & (Q(contact=a)) | (Q(email=b)) | (Q(contact=a)))

        if len(obv) > 0:
            # User already exists
            # messages.error(request, "Error: User already exists. Please log in.")
            print("user exist")
        else:
            obj = Service()
            obj.email = request.POST.get('un')
            obj.password = request.POST.get('pass')
            obj.address = request.POST.get('city')
            obj.service_name = request.POST.get('service_name')
            obj.contact = request.POST.get('contact')
            obj.service_description = request.POST.get('about')

            try:
                myfile = request.FILES['document']
                fs = FileSystemStorage()
                filename = fs.save(myfile.name, myfile)
                obj.document = myfile.name
            except:
                pass

            obj.city = request.POST.get('city')
            obj.location = request.POST.get('location')
            obj.pin = request.POST.get('pin')

            try:
                myfile = request.FILES['pro']
                fs = FileSystemStorage()
                filename = fs.save(myfile.name, myfile)
                obj.profile = myfile.name
            except:
                pass

            obj.status = 'pending'
            obj.save()

            # User registered successfully
            # messages.success(request, "Register form submitted. Please wait for admin approval to login.")
            return HttpResponseRedirect('/login/login/')
    return render(request, 'service/post_service.html')
def view_service(request):
    ss = request.session["u_id"]
    obj = Service.objects.filter(service_id=ss)
    context = {
        'p': obj
    }
    return render(request, 'service/viewservice.html', context)


def post_service_update(request,idd):
    obb=Service.objects.get(service_id=idd)
    context={
        'b':obb
    }
    if request.method=="POST":
        obj=Service.objects.get(service_id=idd)
        obj.email=request.POST.get('un')
        obj.password=request.POST.get('psw')
        obj.address=request.POST.get('city')
        obj.service_name=request.POST.get('service_name')
        obj.contact=request.POST.get('contact')
        obj.service_description=request.POST.get('about')
        # obj.document=request.POST.get('document')
        try:
            myfile = request.FILES['document']
            fs = FileSystemStorage()
            filename = fs.save(myfile.name,myfile)
            obj.document = myfile.name
        except:
            pass

        obj.city=request.POST.get('city')
        obj.location=request.POST.get('location')
        obj.pin=request.POST.get('pin')
        obj.status = 'pending'
        # obj.profile=request.POST.get('profiledoc')
        try:
            myfile = request.FILES['profiledoc']
            fs = FileSystemStorage()
            filename = fs.save(myfile.name, myfile)
            obj.profile = myfile.name
        except:
            pass
        obj.save()

        ob=Login.objects.get(u_id=idd,type='service')
        ob.username=obj.email
        ob.password=obj.password
        ob.save()

    return render(request, 'service/post_service_update.html',context)

def manageservice(request):
    service_count = Service.objects.filter(status='Approved').count()
    service_registerd = Service.objects.count()
    service_rejected = Service.objects.filter(status='Rejected').count()
    service_pending = Service.objects.filter(status='pending').count()

    obj = Service.objects.all()
    context = {
        'ms': obj,
        'service_count': service_count,
        'service_registerd': service_registerd,
        'service_rejected': service_rejected,
        'service_pending': service_pending
    }
    return render(request, 'service/manage_service.html', context)

def approve(request,idd):
    obb=Service.objects.get(service_id=idd)
    obb.status="Approved"
    obb.save()


    obj = Login()
    obj.username = obb.email
    obj.password = obb.password
    obj.type = "service"
    obj.u_id = obb.service_id
    obj.save()
    return manageservice(request)

def reject(request,idd):
    obb=Service.objects.get(service_id=idd)
    obb.status="Rejected"
    obb.save()
    ulog=Login.objects.filter(u_id=idd,type="service")
    if len(ulog)>0:
        ulog[0].delete()
    return manageservice(request)



