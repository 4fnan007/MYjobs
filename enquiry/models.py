from django.db import models
from service.models import Service
from workers.models import Worker
class Enquiry(models.Model):
    enquiry_id = models.AutoField(primary_key=True)
    # service_id = models.IntegerField()
    service = models.ForeignKey(Service, on_delete=models.CASCADE)
    replay = models.CharField(max_length=200)
    enquiry = models.CharField(max_length=45)
    date = models.DateField()
    time = models.TimeField()
    # worker_id = models.IntegerField()
    worker_id = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'enquiry'


