#import RPi.GPIO as GPIO
#import time

# Configuração dos pinos GPIO
#GPIO.setmode(GPIO.BCM)
#GPIO.setup(17, GPIO.OUT)

# Ligar a bomba solenoide
#GPIO.output(17, GPIO.HIGH)
#time.sleep(2)  # Manter a bomba ligada por 5 segundos

# Desligar a bomba solenoide
#GPIO.output(17, GPIO.LOW)

# Limpar as configurações dos pinos GPIO
#GPIO.cleanup()


import RPi.GPIO as GPIO
import requests
import time

# Configuração dos pinos GPIO
GPIO.setmode(GPIO.BCM)
GPIO.setup(17, GPIO.OUT)

while True:
    try:
        # Fazer a requisição HTTP
        response = requests.get('http://10.8.30.147:8000/bombausuario/')  

        # Verificar o estado retornado pela API
        estado = response.json()[0].get('user'and'bomba')

        if estado is not None:
            if estado:
                # Ligar a bomba solenoide
                GPIO.output(17, GPIO.HIGH)
                print('Bomba ligada')
            else:
                # Desligar a bomba solenoide
                GPIO.output(17, GPIO.LOW)
                print('Bomba desligada')

        time.sleep(2)  # Esperar 2 segundos antes de fazer a próxima requisição

    except requests.exceptions.RequestException:
        print('Erro na requisição:')

    except KeyboardInterrupt:
        break

# Limpar as configurações dos pinos GPIO
GPIO.cleanup()
