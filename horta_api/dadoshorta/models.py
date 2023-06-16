from django.db import models

class DadhosHorta(models.Model):
    temperatura = models.CharField(max_length=100)
    humidade = models.CharField(max_length=100)
   
    def __str__(self):
        return self.temperatura + self.humidade

class UmidadeSolo(models.Model):
    umidade = models.CharField(max_length=100)
    
    def __str__(self):
        return self.umidade