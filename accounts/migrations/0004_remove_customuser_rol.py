# Generated by Django 3.2.16 on 2023-10-15 19:36

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0003_auto_20231013_2006'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='customuser',
            name='rol',
        ),
    ]
