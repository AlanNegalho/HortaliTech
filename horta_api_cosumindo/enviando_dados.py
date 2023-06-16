import requests
import json

class Dados():
    def __init__(self, temperatura, humidade):
        self.temperatura = temperatura
        self.humidade = humidade


def buscar_dados():
    request = requests.get("http://10.8.16.199:9000/dadoshorta")
    todos = json.loads(request.content)
    print(todos)


def cadastrar_dados(temperatura, humidade):
    url = 'http://10.8.16.199:9000/dadoshorta/'
    myobj = {'temperatura': temperatura, 'humidade': humidade}

    x = requests.post(url, json = myobj)
    print(x.text)

import time

while True:
    cadastrar_dados(20, 20) 
    buscar_dados()
    time.sleep(3)

'''
curl -i -XPOST http://127.0.0.1:9000/dadoshorta/ --data '{
    "temperatura": "100",
    "humidade": "200"
}' --header "Content-Type: application/json"
'''
