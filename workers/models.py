from django.db import models


class Worker(models.Model):
    worker_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=45)
    email = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    city = models.CharField(max_length=100)
    amount = models.CharField(max_length=45)
    phone_number = models.CharField(max_length=45)
    profile = models.CharField(max_length=250, blank=True, null=True)
    pin = models.CharField(max_length=45)
    location = models.CharField(max_length=45, blank=True, null=True)
    status = models.CharField(max_length=45)
    date = models.DateField(blank=True, null=True)


    class Meta:
        managed = False
        db_table = 'worker'

