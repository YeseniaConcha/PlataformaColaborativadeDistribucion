from django.shortcuts import render, redirect, get_object_or_404
from plataformaApp.models import *
from accounts.models import *
from plataformaApp.forms import *
from django.db.models import Q
from django.http import HttpResponse
from reportlab.pdfgen import canvas
from reportlab.lib import styles
from reportlab.lib.enums import TA_LEFT
from reportlab.lib.pagesizes import letter
from accounts.decorators import permiso_requerido
import base64
from django.core.files.base import ContentFile
from PIL import Image
from django.shortcuts import render, get_object_or_404
from PIL import Image




def index(request):
    return render(request, 'sistema/index.html')


def crearNoticia(request):
    if request.method == 'POST':
        form = NoticiaForm(request.POST, request.FILES)
        if form.is_valid():
            noticia = form.save(commit=False)

            if noticia.imagen:
                noticia.imagen_tipo = noticia.obtener_extension_imagen()
                
                # Redimensionar y guardar la vista previa de la imagen
                if noticia.imagen:
                    image = Image.open(noticia.imagen)
                    image.thumbnail((200, 200))  # Redimensiona la imagen al tamaño deseado
                    image_path = noticia.imagen.path
                    image_path_preview = image_path.replace(f".{noticia.imagen_tipo}", f"_preview.{noticia.imagen_tipo}")
                    image.save(image_path_preview)

            noticia.save()
            return redirect('/noticias')
    else:
        form = NoticiaForm()

    data = {'form': form, 'titulo': 'Ingresar nueva noticia'}
    return render(request, 'gestion/crearNoticia.html', data)

def detalleNoticia(request, id):
    noticia = get_object_or_404(Noticia, id=id)
    return render(request, 'gestion/detalleNoticia.html', {'noticia': noticia})

def editarNoticia(request, id):
    noticia = Noticia.objects.get(id=id)
    data = {
        'form': NoticiaForm(instance=noticia),
        'titulo': 'Editar producto'
    }
    if (request.method == 'POST'):
        form = NoticiaForm(request.POST, instance=noticia)
        if (form.is_valid()):
            form.save()
            return redirect("/noticias")
        else:
            data['form'] = form
    return render(request, 'gestion/crearNoticia.html', data)




@permiso_requerido([0])
def eliminarNoticia(request, id):
    noticia = get_object_or_404(Noticia, id=id)

    if request.method == 'POST':
        noticia.delete()
        return redirect('/noticias')

    return render(request, 'gestion/eliminarNoticia.html', {'noticia': noticia})

""" ----------------------------------------------------------------- """

def detalleDocumento(request, id):
    documento = get_object_or_404(Documento, id=id)
    # Puedes agregar cualquier lógica adicional que desees para mostrar los detalles del documento.
    return render(request, 'gestion/detalleDocumento.html', {'documento': documento})

def crearDocumento(request):
    if request.method == 'POST':
        form = DocumentoForm(request.POST, request.FILES)
        if form.is_valid():
            documento = form.save()
            return redirect('detalleDocumento', id=documento.id)  # Redirige a la página de detalles del documento
    else:
        form = DocumentoForm()

    data = {'form': form, 'titulo': 'Ingresar nuevo Documento'}
    return render(request, 'gestion/crearDocumento.html', data)


@permiso_requerido([0])
def editarDocumento(request, id):
    documento = Documento.objects.get(id=id)
    data = {
        'form': DocumentoForm(instance=documento),
        'titulo': 'Editar documento'
    }
    if (request.method == 'POST'):
        form = DocumentoForm(request.POST, instance=documento)
        if (form.is_valid()):
            form.save()
            return redirect("/documentos")
        else:
            data['form'] = form
    return render(request, 'gestion/crearDocumento.html', data)

@permiso_requerido([0])
def eliminarDocumento(request, id):
    documento = get_object_or_404(Documento, id=id)

    if request.method == 'POST':
        documento.delete()
        return redirect('/documentos')

    return render(request, 'gestion/eliminarDocumento.html', {'documento': documento})

""" ----------------------------------------------------------------- """


@permiso_requerido([0,1])
def noticias_list(request):
    lista_noticias = Noticia.objects.all()
    return render(request, 'registration/noticias.html', {'lista_noticias': lista_noticias})

""" ----------------------------------------------------------------- """


@permiso_requerido([0])
def usuarios_list(request):
    lista_usuarios = CustomUser.objects.all()
    return render(request, 'registration/usuarios.html', {'lista_usuarios': lista_usuarios})

""" ----------------------------------------------------------------- """

@permiso_requerido([0,1])
def documentos_list(request):
    lista_documentos = Documento.objects.all()
    return render(request, 'registration/documentos.html', {'lista_documentos': lista_documentos})

""" ----------------------------------------------------------------- """


def access_denied(request):
    return render(request, 'registration/access_denied.html')


""" ----------------------------------------------------------------- """


def page_not_found(request, exception):
    return render(request, 'sistema/404.html', status=404)
