from rest_framework import serializers
from dadoshorta.models import DadhosHorta , UmidadeSolo

class DadosHortaSerializer(serializers.ModelSerializer):
    class Meta:
        model = DadhosHorta
        fields = '__all__'

class UmidadeSoloSerializer(serializers.ModelSerializer):
    class Meta:
        model = UmidadeSolo
        fields = '__all__'