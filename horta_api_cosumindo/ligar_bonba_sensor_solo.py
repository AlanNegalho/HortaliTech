import RPi.GPIO as GPIO
import time
import requests

# Configuração dos pinos GPIO
GPIO.setmode(GPIO.BCM)
GPIO.setup(17, GPIO.OUT)

channel = 21
GPIO.setup(channel, GPIO.IN)

def callback(channel):
    umidade = GPIO.input(channel)
            # Fazer a requisição HTTP
    response = requests.get('http://10.8.30.147:8000/bomba/')  

        # Verificar o estado retornado pela API
    estado = response.json()[0].get('estado')
    
    print(umidade)
    
    if umidade == 1:
        print("Solo seco")
        # Ligar a bomba solenoide
        GPIO.output(17, GPIO.HIGH)
    elif umidade == 0:
        print("Solo molhado")
        # Desligar a bomba solenoide
        GPIO.output(17, GPIO.LOW)
    else:
        print("Nenhuma leitura feita!")


    
    url = 'http://10.8.30.147:8000/umidadesolo/'
    data = {'umidade': umidade}

    x = requests.post(url, json=data)
    print(x.text)

GPIO.add_event_detect(channel, GPIO.BOTH, bouncetime=300)
GPIO.add_event_callback(channel, callback)

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    pass

# Limpar as configurações dos pinos GPIO
GPIO.cleanup()
