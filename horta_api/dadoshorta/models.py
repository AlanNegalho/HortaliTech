from django.utils import timezone
from django.db import models

class DadhosHorta(models.Model):
    temperatura = models.CharField(max_length=100)
    umidade = models.CharField(max_length=100)
    criado = models.DateTimeField(default=timezone.now)
   
    def __str__(self):
        return self.temperatura + self.umidade

class UmidadeSolo(models.Model):
    umidade = models.CharField(max_length=100)
    
    def __str__(self):
        return self.umidade

class Bomba(models.Model):
    """ Se estado = True liga a bomba, e false desliga a bomba"""
    estado = models.BooleanField(default=False)

    def __str__(self):
        return self.estado
