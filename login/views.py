from django.http import HttpResponseRedirect
from django.shortcuts import render
from login.models import Login
# Create your views here.

def view_login (request):
    if request.method=="POST":
        username = request.POST.get("un")
        password = request.POST.get("ps")
        obj=Login.objects.filter(username=username,password=password)
        print(len(obj))
        tp= ""
        for ob in obj:
            tp = ob.type
            uid = ob.u_id
            if tp == "admin":
                request.session["u_id"]= uid
                return HttpResponseRedirect('/temp/admin_index/')
            elif tp == "service":
                request.session["u_id"]=uid
                return HttpResponseRedirect('/temp/service_index/')
            elif tp == "worker":
                request.session["u_id"] = uid
                return HttpResponseRedirect('/temp/worker_index/')
            else:
                objlist = "username or password incorrect... Try again fail again fail better"
                context={
                    'msg':objlist,
                }
                return render(request,'login/login.html',context)

    return render(request, 'login/login.html')