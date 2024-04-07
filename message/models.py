from django.db import models
from service.models import Service
from workers.models import Worker

class Message(models.Model):
    msg_id = models.AutoField(primary_key=True)
    # service_id = models.IntegerField()
    service = models.ForeignKey(Service, on_delete=models.CASCADE)
    # worker_id = models.IntegerField()
    worker = models.ForeignKey(Worker, on_delete=models.CASCADE)
    description = models.CharField(max_length=200)
    date = models.DateField()
    time = models.TimeField()


    class Meta:
        managed = False
        db_table = 'message'
