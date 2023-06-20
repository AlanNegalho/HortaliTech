from rest_framework import serializers
from dadoshorta.models import DadhosHorta , UmidadeSolo, Bomba

class DadosHortaSerializer(serializers.ModelSerializer):
    class Meta:
        model = DadhosHorta
        fields = '__all__'

class UmidadeSoloSerializer(serializers.ModelSerializer):
    class Meta:
        model = UmidadeSolo
        fields = '__all__'


class BombaSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(read_only=True)
    class Meta:
        model = Bomba
        fields = ['id', 'estado']


