from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import CustomUser, Rol  # Asegúrate de importar el modelo Rol

class CustomUserCreationForm(UserCreationForm):

    class Meta(UserCreationForm.Meta):
        model = CustomUser
        fields = UserCreationForm.Meta.fields + ('nombre_completo', 'direccion', 'telefono', 'email', 'tipo_permisos', 'is_staff', 'is_active')
