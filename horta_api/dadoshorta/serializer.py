from rest_framework import serializers
from dadoshorta.models import DadhosHorta , UmidadeSolo, Bomba

class DadosHortaSerializer(serializers.ModelSerializer):
    data = serializers.DateTimeField(format="%d/%m/%Y %H:%M:%S", required=False)
    class Meta:
        model = DadhosHorta
        fields = ['temperatura', 'umidade', 'data']

class UmidadeSoloSerializer(serializers.ModelSerializer):
    class Meta:
        model = UmidadeSolo
        fields = '__all__'


class BombaSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(read_only=True)
    class Meta:
        model = Bomba
        fields = ['id', 'estado']


