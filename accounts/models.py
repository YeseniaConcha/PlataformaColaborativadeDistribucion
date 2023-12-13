from django.db import models
from django.contrib.auth.models import AbstractUser, Group, Permission
from plataformaApp.models import *
from django.contrib.contenttypes.models import ContentType


class CustomUser(AbstractUser):
    # Otros campos personalizados y lógica aquí
    nombre_completo = models.CharField(max_length=70)
    direccion = models.CharField(max_length=100)
    telefono = models.CharField(max_length=12)

    tipo_permisos_choices = (
        (0, 'Administrador'),
        (1, 'MiembroUa'),

    )
    tipo_permisos = models.IntegerField(choices=tipo_permisos_choices, default=0)
    groups = models.ManyToManyField(Group, related_name='custom_users')  # Cambia aquí
    user_permissions = models.ManyToManyField(Permission, related_name='custom_users_permissions')  # Cambia aquí
    USERNAME_FIELD = 'username'
    EMAIL_FIELD = 'email'
    
    class Meta:
        verbose_name = "usuario"
        verbose_name_plural = "usuarios"

    def __str__(self):
        return self.username

class Permiso(models.Model):
    nombre = models.CharField(max_length=50, unique=True)
    descripcion = models.TextField(blank=True)

    class Meta:
        verbose_name = "Permiso"
        verbose_name_plural = "Permisos"

    def __str__(self):
        return self.nombre

class Rol(models.Model):
    nombre = models.CharField(max_length=50, unique=True)
    descripcion = models.TextField(blank=True)

    class Meta:
        verbose_name = "Rol"
        verbose_name_plural = "Roles"

    def __str__(self):
        return self.nombre

