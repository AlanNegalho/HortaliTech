import time
import Adafruit_DHT
import requests

pin_dht11 = 4
sensor_type = Adafruit_DHT.DHT11
url = 'http://10.8.30.139:8000/dadoshorta/'

def send_data_to_server(data):
    try:
        x = requests.post(url, json=data)
        print(x.text)
    except requests.exceptions.RequestException as e:
        print(f"Erro ao enviar dados para o servidor: {e}")
        time.sleep(10.0)
        send_data_to_server(data)

while True:
    humidity, temperature = Adafruit_DHT.read_retry(sensor_type,pin_dht11)
    if humidity is not None and temperature is not None:
        print(f"Temperature={temperature}°C Umidade={humidity}%")
    else:
        print('falha ao ler o sensor')
    
    data = {'temperatura': temperature, 'humidade': humidity}
    send_data_to_server(data)
    
    time.sleep(10.0)

