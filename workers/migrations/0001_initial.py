# Generated by Django 3.2.21 on 2023-12-29 08:29

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Worker',
            fields=[
                ('worker_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=45)),
                ('email', models.CharField(max_length=100)),
                ('password', models.CharField(max_length=100)),
                ('city', models.CharField(max_length=100)),
                ('amount', models.CharField(max_length=45)),
                ('phone_number', models.CharField(max_length=45)),
                ('profile', models.CharField(max_length=45)),
                ('pin', models.CharField(max_length=45)),
                ('location', models.CharField(max_length=45)),
                ('status', models.CharField(max_length=45)),
            ],
            options={
                'db_table': 'worker',
                'managed': False,
            },
        ),
    ]
