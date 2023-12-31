# Sistema de Monitoramento e Controle de Irrigação

Este repositório contém o código-fonte e a documentação para um sistema de monitoramento e controle de irrigação baseado em um Raspberry Pi. O sistema integra sensores de umidade do solo e um sensor digital de umidade e temperatura (DHT11) e valvula solenoide como atuador para fornecer dados em tempo real ao usuário através de um aplicativo mobile. Além disso, o sistema permite que o usuário controle a irrigação remotamente.

## Componentes Principais

1. **Aplicativo Mobile**: O usuário pode acessar dados relacionados à temperatura e umidade do ambiente, bem como à umidade do solo, através deste aplicativo. Além disso, o usuário tem a capacidade de controlar a irrigação remotamente.

2. **API (Application Programming Interface)**: Responsável por gerenciar os dados do sistema e transmitir comandos realizados pelo usuário através do aplicativo. A API é o ponto central para a comunicação entre o aplicativo e o sistema embarcado.

3. **Raspberry Pi**: Atua no gerenciamento dos componentes e sensores. Recebe dados do sensor de umidade do solo e do sensor DHT11. Além disso, controla um relé que ativa a válvula solenóide com base nas condições do solo e nos comandos recebidos do aplicativo.

4. 
## Funcionalidades

- Monitoramento em tempo real da temperatura e umidade do ambiente.
- Monitoramento da umidade do solo para determinar a necessidade de irrigação.
- Controle remoto da irrigação através do aplicativo mobile.
- Armazenamento seguro e confiável de dados no banco de dados relacional.

## Instalação e Configuração

1. Clone este repositório:
   ```
   git clone https://github.com/AlanNegalho/HortaliTech.git
   ```

2. Siga as instruções no README de cada componente para configurar e executar o sistema.

## Contribuições

Se você deseja contribuir para este projeto, por favor, siga as diretrizes de contribuição especificadas neste repositório.

---

Este projeto é uma solução robusta e eficiente para o monitoramento e controle de irrigação, oferecendo aos usuários uma maneira fácil e conveniente de gerenciar suas plantações e jardins.
