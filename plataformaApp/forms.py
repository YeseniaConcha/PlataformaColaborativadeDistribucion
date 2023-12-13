from django import forms
from django.forms import ModelForm
from .models import *
from django.core.exceptions import ValidationError




class NoticiaForm(forms.Form):
    titulo = forms.CharField(widget=forms.CharField(max_length=200))
    contenido = forms.CharField(widget=forms.CharField(max_length=5000))
    imagen = forms.ImageField()
    imagen_base64 = forms.CharField(widget=forms.HiddenInput(), required=False)  # Campo oculto para imagen_base64
    imagen_tipo = forms.CharField(widget=forms.HiddenInput(), required=False)  # Campo oculto para imagen_tipo
    

class NoticiaForm(forms.ModelForm):
    class Meta:
        model = Noticia
        fields = '__all__'


class DocumentoForm(forms.Form):
    Nombre_Documento= forms.CharField(widget=forms.CharField(max_length=200))
    Descripción_Documento = forms.CharField(widget=forms.CharField(max_length=5000))
    Archivo_pdf = forms.FileField()

class DocumentoForm(forms.ModelForm):
    class Meta:
        model = Documento
        fields = '__all__'



