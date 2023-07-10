
from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from dadoshorta.views import DadosHortaViewSet, UmidadeSoloViewSet, BonbaUsuarioViewSet

router = routers.DefaultRouter()
router.register('dadoshorta', DadosHortaViewSet)
router.register('umidadesolo', UmidadeSoloViewSet)
router.register('bombausuario', BonbaUsuarioViewSet)

urlpatterns = [
    path("admin", admin.site.urls),
    path('', include(router.urls))    
]
