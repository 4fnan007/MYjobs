from django.db import models
from workers.models import Worker
from service.models import Service
from application.models import Application


class Payment(models.Model):
    payment_id = models.AutoField(primary_key=True)
    # worker_id = models.IntegerField(blank=True, null=True)
    worker = models.ForeignKey(Worker, on_delete=models.CASCADE)
    # service_id = models.IntegerField()
    service = models.ForeignKey(Service, on_delete=models.CASCADE)
    description = models.CharField(max_length=200)
    amount = models.CharField(max_length=45)
    # application_id = models.IntegerField()
    application = models.ForeignKey(Application, on_delete=models.CASCADE)
    date = models.DateField()
    time = models.TimeField()





    class Meta:
        managed = False
        db_table = 'payment'