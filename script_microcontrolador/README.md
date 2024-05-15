# Script micro controladora

## Descrição Geral

O sistema utiliza um sensor de umidade do solo conectado a um Arduino, que envia os dados de umidade para um Raspberry Pi. O Raspberry Pi, por sua vez, controla a bomba d'água com base nos dados recebidos, além de enviar esses dados para um servidor remoto para registro e análise. Além disso, o Raspberry Pi também lê dados de temperatura e umidade de outro sensor (DHT11) e envia esses dados para o servidor remoto.

## Pré-requisitos

- Arduino Uno ou compatível
- Sensor de umidade do solo
- Raspberry Pi 3 ou superior
- Cabo USB para conectar o Arduino ao Raspberry Pi
- Servidor remoto para armazenamento e análise de dados (APIs disponibilizadas)

## Instalação

### Arduino

1. Carregue o sketch do Arduino no dispositivo usando o Arduino IDE.
2. Conecte o Arduino ao Raspberry Pi usando um cabo USB.

### Raspberry Pi

1. Instale as bibliotecas necessárias:

2. Execute o script Python.

## Uso

- Após a instalação, o sistema começará a operar automaticamente, lendo a umidade do solo e controlando a bomba d'água conforme necessário.
- Os dados de umidade do solo e outros parâmetros podem ser visualizados no monitor serial do Arduino IDE e no terminal do Raspberry Pi.
- Para testar o sistema, você pode modificar os limiares de umidade no script Python e observar como isso afeta o comportamento da bomba d'água.

