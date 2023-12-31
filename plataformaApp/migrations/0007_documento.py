# Generated by Django 3.2.16 on 2023-10-17 00:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('plataformaApp', '0006_auto_20231015_1736'),
    ]

    operations = [
        migrations.CreateModel(
            name='Documento',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombreDocumento', models.CharField(max_length=500)),
                ('descripcionDocumento', models.CharField(max_length=1000)),
                ('archivo_pdf', models.FileField(upload_to='archivos_pdf/')),
            ],
        ),
    ]
