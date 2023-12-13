from django.db import models
from django.utils import timezone
from django.core.exceptions import ValidationError
import base64
from PIL import Image
from django.core.exceptions import ValidationError
from django.core.validators import FileExtensionValidator

# Create your models here.


class Noticia(models.Model):
    titulo = models.CharField(max_length=200)
    contenido = models.TextField()
    imagen = models.ImageField(upload_to='noticias/', null=True, blank=True)
    fecha_publicacion = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = "noticia"
        verbose_name_plural = "noticias"

    def str(self):
        return self.titulo

    @property
    def imagen_base64(self):
        if self.imagen:
            with open(self.imagen.path, "rb") as image_file:
                data = base64.b64encode(image_file.read()).decode('utf-8')
                return f"data:image/{self.obtener_extension_imagen()};base64,{data}"
        return None

    def obtener_extension_imagen(self):
        if self.imagen:
            return self.imagen.name.split('.')[-1].lower()


""" --------------------------------------------------- """


class roles(models.Model):
    nombre = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=150)

    class Meta:
        verbose_name = "permiso"
        verbose_name_plural = "permisos"

    def __str__(self):
        return self.nombre


""" --------------------------------------------------- """

def validate_pdf_extension(value):
    if not value.name.endswith('.pdf'):
        raise ValidationError('Solo se permiten archivos PDF.')

class Documento(models.Model):
    nombreDocumento = models.CharField(max_length=500)
    descripcionDocumento = models.CharField(max_length=1000)
    archivo_pdf = models.FileField(upload_to='archivos_pdf/', validators=[FileExtensionValidator(allowed_extensions=['pdf']), validate_pdf_extension])
    fecha_publicacion = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = "documento"
        verbose_name_plural = "documentos"

    def __str__(self):
        return self.nombreDocumento
