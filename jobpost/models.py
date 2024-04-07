from django.db import models
from service.models import Service

class JobPost(models.Model):
    jobpost_id = models.AutoField(primary_key=True)
    job_post = models.CharField(max_length=45)
    # service_id = models.IntegerField()
    service = models.ForeignKey(Service, on_delete=models.CASCADE)
    description = models.CharField(max_length=200)
    date = models.DateField()
    time = models.TimeField()
    status = models.CharField(max_length=45)


    class Meta:
        managed = False
        db_table = 'job_post'

