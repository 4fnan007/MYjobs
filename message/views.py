from django.shortcuts import render
from message.models import Message
from workers.models import Worker
import datetime
# Create your views here.

def view_message(request):
    ss = request.session["u_id"]
    obj = Message.objects.filter(worker_id=ss)
    context = {
        'g': obj
    }
    return render(request, 'message/viewmessage.html',context)


def post_msg(request):
    ss=request.session["u_id"]
    obb=Worker.objects.all()
    context={
        'a':obb
    }
    if request.method=='POST':
        obj=Message()
        obj.worker_id=request.POST.get('wrkr')
        obj.service_id=ss
        obj.description=request.POST.get('msg')
        obj.date=datetime.datetime.today()
        obj.time=datetime.datetime.now()
        obj.save()
    return render(request, 'message/post_msg.html',context)