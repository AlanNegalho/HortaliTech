
from django.contrib import admin
from dadoshorta.models import DadhosHorta, UmidadeSolo, BombaUsuario

class DadosHostas(admin.ModelAdmin):
    list_display = ('id', 'temperatura', 'umidade')
    list_per_page = 25

admin.site.register(DadhosHorta, DadosHostas)

admin.site.register(UmidadeSolo)



admin.site.register(BombaUsuario)