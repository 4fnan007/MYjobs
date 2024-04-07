from django.db import models
from jobpost.models import JobPost
from workers.models import Worker
# Create your models here.

class Application(models.Model):
    application_id = models.AutoField(primary_key=True)
    # jobpost_id = models.IntegerField()
    jobpost=models.ForeignKey(JobPost,on_delete=models.CASCADE)
    # worker_id = models.IntegerField(blank=True, null=True)
    worker=models.ForeignKey(Worker,on_delete=models.CASCADE)
    status = models.CharField(max_length=45)
    resume = models.CharField(max_length=60, blank=True, null=True)
    apply_sts = models.CharField(max_length=45)
    name = models.CharField(max_length=45)
    place = models.CharField(max_length=45)
    phone_number = models.CharField(max_length=45)
    date = models.CharField(max_length=45, blank=True, null=True)
    time = models.CharField(max_length=45, blank=True, null=True)



    class Meta:
        managed = False
        db_table = 'application'
