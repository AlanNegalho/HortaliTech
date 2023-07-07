from rest_framework import serializers
from dadoshorta.models import DadhosHorta , UmidadeSolo, Bomba, BombaUsuario

class DadosHortaSerializer(serializers.ModelSerializer):
    data = serializers.DateTimeField(format="%d/%m/%Y %H:%M:%S", required=False)
    class Meta:
        model = DadhosHorta
        fields = ['temperatura', 'umidade', 'data']

class UmidadeSoloSerializer(serializers.ModelSerializer):
    data = serializers.DateTimeField(format="%d/%m/%Y %H:%M:%S", required=False)
    class Meta:
        model = UmidadeSolo
        fields = ['umidade', 'data']


class BombaSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(read_only=True)
    class Meta:
        model = Bomba
        fields = ['id', 'estado']


class BombaUsuarioSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(read_only=True)
    class Meta:
        model = BombaUsuario
        fields = ['id', 'user', 'bomba']