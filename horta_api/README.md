# API RESTful do Sistema HortaliTech
Este repositório contém o código-fonte e a documentação para uma API RESTful desenvolvida para fornecer dados de monitoramento e controle. A API foi projetada para ser eficiente, escalável e fácil de usar, fornecendo endpoints específicos para diferentes funcionalidades.

## Configuração do Ambiente Virtual

Para garantir a independência do ambiente de desenvolvimento, é recomendado criar um ambiente virtual para instalar as dependências da API. Siga os passos abaixo para configurar o ambiente virtual:

1. Crie um novo ambiente virtual:
    ```bash
    python -m venv nome_do_ambiente
    ```

2. Ative o ambiente virtual:
    - No Windows:
        ```bash
        nome_do_ambiente\Scripts\activate
        ```
    - No macOS e Linux:
        ```bash
        source nome_do_ambiente/bin/activate
        ```

## Instalação das Dependências

Após configurar o ambiente virtual, instale as dependências necessárias usando o comando a seguir:

```bash
pip install -r requirements.txt
```

## Endpoints Disponíveis

A API possui os seguintes endpoints para acessar diferentes funcionalidades:

- **/dadoshorta**: Endpoint para obter dados relacionados à horta.
- **/humidadesolo**: Endpoint para acessar informações sobre a umidade do solo.
- **/bombausuario**: Endpoint para gerenciamento da bomba de água pelo usuário.

## Exportação de Dados para Arquivo .xlsx

A API oferece a possibilidade de gerar um arquivo `.xlsx` contendo os dados armazenados no banco da aplicação, coletados pelos sensores. Para gerar o arquivo, siga os passos abaixo:

1. Acesse a URL base onde a API está rodando.
2. Após a URL base, digite `/export_xlsx/`.
3. Um arquivo `.zip` contendo o arquivo `.xlsx` será gerado para download.

