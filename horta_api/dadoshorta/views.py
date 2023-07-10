from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets
from dadoshorta.serializer import DadosHortaSerializer, UmidadeSoloSerializer, BombaUsuarioSerializer
from dadoshorta.models import DadhosHorta, UmidadeSolo, BombaUsuario

class DadosHortaViewSet(viewsets.ModelViewSet):
    """Listando clientes"""
    queryset = DadhosHorta.objects.all().order_by('-id')
    serializer_class = DadosHortaSerializer

class UmidadeSoloViewSet(viewsets.ModelViewSet):
    """Listando umidade do solo"""
    queryset = UmidadeSolo.objects.all().order_by('-id')
    serializer_class = UmidadeSoloSerializer

class BonbaUsuarioViewSet(viewsets.ModelViewSet):
    """Listando BombaUsuario"""
    queryset = BombaUsuario.objects.all()
    serializer_class = BombaUsuarioSerializer