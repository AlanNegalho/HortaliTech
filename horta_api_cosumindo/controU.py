import RPi.GPIO as GPIO
import requests
import time
import Adafruit_DHT

# Configuração dos pinos GPIO
GPIO.setmode(GPIO.BCM)
GPIO.setup(17, GPIO.OUT)
channel = 21
GPIO.setup(channel, GPIO.IN)

# URLs para enviar os dados de umidade do solo e obter o estado da bomba
url_umidade_solo = 'https://alanoliveira.pythonanywhere.com/umidadesolo/'
url_estado_bomba = 'https://alanoliveira.pythonanywhere.com/bombausuario/'
url_dados_horta = 'https://alanoliveira.pythonanywhere.com/dadoshorta/'

def callback(channel):
    umidade = GPIO.input(channel)
    if umidade:
        print("Seco")
    else:
        print("Molhado")

    estado_bomba = obter_estado_bomba()
    estado_usuario = estado_bomba.get('user')

    # Controlar a bomba com base no estado obtido da API, estado do usuário e umidade do solo
    if estado_usuario:
        if estado_bomba.get('bomba'):
            ligar_bomba()
        else:
            desligar_bomba()
    else:
        if umidade:
            ligar_bomba()
        else:
            desligar_bomba()

def enviar_dados_umidade_solo():
    umidade = GPIO.input(channel)
    data_umidade_solo = {'umidade': umidade}
    try:
        response = requests.post(url_umidade_solo, json=data_umidade_solo)
        response.raise_for_status()
        print("Dados de umidade do solo enviados com sucesso.")
    except requests.exceptions.RequestException :
        print(f"Falha ao enviar dados de umidade do solo:")

def obter_estado_bomba():
    try:
        response = requests.get(url_estado_bomba)
        dados = response.json()
        if len(dados) > 0:
            return dados[0]
    except requests.exceptions.RequestException :
        print(f'Erro ao obter o estado da bomba: ')
    return {'user': False, 'bomba': False}

def ligar_bomba():
    GPIO.output(17, GPIO.HIGH)
    print('Bomba ligada')

def desligar_bomba():
    GPIO.output(17, GPIO.LOW)
    print('Bomba desligada')

def enviar_dados_horta(temperatura, umidade):
    data_horta = {'temperatura': temperatura, 'umidade': umidade}
    try:
        response = requests.post(url_dados_horta, json=data_horta)
        response.raise_for_status()
        print("Dados emperatura e Umidade enviados com sucesso.")
    except requests.exceptions.RequestException :
        print(f"Falha ao enviar dados Temperatura e Umidade: ")

try:
    umidade_intervalo = 240.0  # Intervalo em segundos para enviar os dados de umidade do solo
    usuario_intervalo = 2 # Intervalo em segundos para verificar o estado do usuário
    horta_intervalo = 240.0  # Intervalo em segundos para enviar os dados da horta

    umidade_tempo_anterior = time.time()
    usuario_tempo_anterior = time.time()
    horta_tempo_anterior = time.time()

    while True:
        callback(channel)

        # Verificar se é hora de enviar os dados de umidade do solo
        if time.time() - umidade_tempo_anterior >= umidade_intervalo:
            enviar_dados_umidade_solo()
            umidade_tempo_anterior = time.time()

        # Verificar se é hora de verificar o estado do usuário
        if time.time() - usuario_tempo_anterior >= usuario_intervalo:
            estado_bomba = obter_estado_bomba()
            estado_usuario = estado_bomba.get('user')
            if estado_usuario:
                if estado_bomba.get('bomba'):
                    ligar_bomba()
                else:
                    desligar_bomba()
            usuario_tempo_anterior = time.time()

        # Verificar se é hora de enviar os dados da horta
        if time.time() - horta_tempo_anterior >= horta_intervalo:
            humidity, temperature = Adafruit_DHT.read_retry(Adafruit_DHT.DHT11, 4)
            if humidity is not None and temperature is not None:
                print(f"Temperature={temperature}°C Umidade={humidity}%")
                enviar_dados_horta(temperature, humidity)
            else:
                print('Falha ao ler o sensor de temperatura e umidade.')

            horta_tempo_anterior = time.time()

        time.sleep(3)  # Esperar 1 segundo antes de verificar novamente

except KeyboardInterrupt:
    print("Encerrando...")

finally:
    # Limpar as configurações dos pinos GPIO
    GPIO.cleanup()
