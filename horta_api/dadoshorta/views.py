from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets
from dadoshorta.serializer import DadosHortaSerializer, UmidadeSoloSerializer, BombaSerializer
from dadoshorta.models import DadhosHorta, UmidadeSolo, Bomba

class DadosHortaViewSet(viewsets.ModelViewSet):
    """Listando clientes"""
    queryset = DadhosHorta.objects.all()
    serializer_class = DadosHortaSerializer

class UmidadeSoloViewSet(viewsets.ModelViewSet):
    """Listando umidade do solo"""
    queryset = UmidadeSolo.objects.all()
    serializer_class = UmidadeSoloSerializer

class BombaViewSet(viewsets.ModelViewSet):
    """Listando bomba"""
    queryset = Bomba.objects.all()
    serializer_class = BombaSerializer
