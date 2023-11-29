
from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from dadoshorta.views import DadosHortaViewSet, UmidadeSoloViewSet, BonbaUsuarioViewSet
from dadoshorta.save_db import ExportXLSX

router = routers.DefaultRouter()
router.register('dadoshorta', DadosHortaViewSet)
router.register('umidadesolo', UmidadeSoloViewSet)
router.register('bombausuario', BonbaUsuarioViewSet)

urlpatterns = [
    path("admin", admin.site.urls),
    path('export_xlsx/', ExportXLSX.as_view(), name='export_data_to_xlsx'),
    path('', include(router.urls))
]
