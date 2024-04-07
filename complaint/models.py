from django.db import models
from workers.models import Worker
from service.models import Service
class Complaint(models.Model):
    time = models.TimeField()
    complaint_id = models.AutoField(primary_key=True)
    # worker_id = models.IntegerField()
    worker = models.ForeignKey(Worker, on_delete=models.CASCADE)
    # service_id = models.IntegerField()
    service = models.ForeignKey(Service, on_delete=models.CASCADE)
    complaint_description = models.CharField(max_length=200)
    replay = models.CharField(max_length=200)
    date = models.DateField()

    class Meta:
        managed = False
        db_table = 'complaint'
