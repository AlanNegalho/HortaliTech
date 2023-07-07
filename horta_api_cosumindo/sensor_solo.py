import RPi.GPIO as GPIO
import time
import requests

# GPIO setup
channel = 21
GPIO.setmode(GPIO.BCM)
GPIO.setup(channel, GPIO.IN)

# URL for sending moisture data
url = 'http://10.8.30.147:8000/umidadesolo/'

def callback(channel):
    umidade = GPIO.input(channel)
    if umidade:
        print("Seco")
    else:
        print("Molhado")
    
    # Send moisture data to the server
    data = {'umidade': umidade}
    try:
        response = requests.post(url, json=data)
        response.raise_for_status()
        print("Data sent successfully.")
    except requests.exceptions.RequestException as e:
        print(f"Failed to send data: {e}")

# Add event detection and callback
GPIO.add_event_detect(channel, GPIO.BOTH, bouncetime=300)
GPIO.add_event_callback(channel, callback)

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    print("Exiting...")
finally:
    GPIO.cleanup()
