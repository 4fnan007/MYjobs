from django.shortcuts import render
from payment.models import Payment
from application.models import Application
import datetime
from jobpost.models import JobPost #----> change
from workers.models import Worker
# Create your views here.

def post_payment(request,idd):
    ss=request.session["u_id"]
    obb=Application.objects.get(status="Approved",application_id=idd)
    context={
        'x':obb
    }
    if request.method=="POST":
        obj=Payment()
        obj.application_id=idd
        obj.service_id=ss
        obj.description=request.POST.get('payment_description')
        obj.amount=request.POST.get('payment_amount')
        obj.application_id = idd
        obj.date=datetime.datetime.today()
        obj.time=datetime.datetime.now()
        obj.save()
    return render(request, 'payment/post_payment.html',context)

def view_payment(request):
    ss = request.session["u_id"]
    obj = Payment.objects.filter(application__worker_id=ss)
    context = {
        'h': obj
    }
    return render(request, 'payment/viewpayment.html',context)

def service_view_payment(request):
    ss = request.session["u_id"]
    obj = Payment.objects.filter(service_id=ss)
    context = {
        'h': obj
    }
    return render(request, 'payment/ser_viewpayment.html',context)

