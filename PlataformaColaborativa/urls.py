"""PlataformaColaborativa URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.conf import settings
from django.conf import settings
from django.conf.urls.static import static
from django.conf.urls.static import static
from django.urls import path, include
from plataformaApp.views import *
from accounts.views import *
from django.views.defaults import page_not_found
from accounts.views import page_not_found as accounts_page_not_found
from plataformaApp.views import page_not_found as plataformaApp_page_not_found


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', index, name='index'),
    path('signup/', SignUpView.as_view(), name='signup'),
    path('login/', CustomLoginView.as_view(template_name='registration/login.html'), name='login'),
    path('logout/', CustomLogoutView.as_view(), name='logout'),
    path('accounts/', include('django.contrib.auth.urls')),
    path('noticias/', noticias_list, name='noticias'),
    path('noticias/agregar/', crearNoticia, name='crearNoticia'),
    path('noticias/editar/<int:id>/', editarNoticia, name='editarNoticia'),
    path('noticias/eliminar/<int:id>/', eliminarNoticia, name='eliminarNoticia'),
    path('noticias/<int:id>/', detalleNoticia, name='detalleNoticia'),
    path('documentos/', documentos_list, name='documentos'),
    path('documentos/agregar/', crearDocumento, name='crearDocumento'),
    path('documentos/editar/<int:id>/', editarDocumento, name='editarDocumento'),
    path('documentos/eliminar/<int:id>/', eliminarDocumento, name='eliminarDocumento'),
    path('documentos/detalle/<int:id>/', detalleDocumento, name='detalleDocumento'),
    path('usuarios/', usuarios_list, name='usuarios'),
    path('usuarios/agregar/', crearUsuario, name='crearUsuario'),
    path('usuarios/editar/<int:id>/', editarUsuario, name='editarUsuario'),
    path('access-denied/', access_denied, name='access_denied'),
    path('plataformaApp/404/', plataformaApp_page_not_found,
         name='plataformaApp_page_not_found'),
    path('accounts/404/', accounts_page_not_found,
         name='accounts_page_not_found'),


]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
handler404 = 'plataformaApp.views.page_not_found'
