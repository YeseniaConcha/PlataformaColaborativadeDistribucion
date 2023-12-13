# Generated by Django 3.2.16 on 2023-10-18 22:57

import django.core.validators
from django.db import migrations, models
import plataformaApp.models


class Migration(migrations.Migration):

    dependencies = [
        ('plataformaApp', '0008_documento_fecha_publicacion'),
    ]

    operations = [
        migrations.AlterField(
            model_name='documento',
            name='archivo_pdf',
            field=models.FileField(upload_to='archivos_pdf/', validators=[django.core.validators.FileExtensionValidator(allowed_extensions=['pdf']), plataformaApp.models.validate_pdf_extension]),
        ),
    ]