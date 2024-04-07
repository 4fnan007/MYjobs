from django.db import models


class Service(models.Model):
    service_id = models.AutoField(primary_key=True)
    email = models.CharField(max_length=45)
    password = models.CharField(max_length=45)
    service_name = models.CharField(max_length=45)
    service_description = models.CharField(max_length=45, blank=True, null=True)
    contact = models.DecimalField(max_digits=10, decimal_places=0)
    city = models.CharField(max_length=45)
    document = models.CharField(max_length=250, blank=True, null=True)
    location = models.CharField(max_length=45)
    profile = models.CharField(max_length=250, blank=True, null=True)
    pin = models.CharField(max_length=45)
    status = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'service'


