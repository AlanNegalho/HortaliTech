# HortaliTech

### Instalação das Dependências do Aplicativo Flutter

Para garantir que o aplicativo Flutter funcione corretamente em sua máquina, é necessário instalar todas as dependências e bibliotecas necessárias. Siga as instruções abaixo para configurar o ambiente de desenvolvimento e instalar as dependências do aplicativo.

## Pré-requisitos

- Certifique-se de que o Flutter SDK esteja instalado em sua máquina. Se ainda não estiver instalado, você pode seguir as instruções no [site oficial do Flutter](https://flutter.dev/docs/get-started/install) para fazer a instalação.

## Instalação das Dependências

1. **Acesse o Diretório do Projeto**: Navegue até o diretório raiz do seu projeto Flutter usando o terminal ou prompt de comando.

   Dentro do app_horta localize e abra o arquivo pubspec.yaml no editor de códigos Vs Code apos aberto na parte superior direita, visualize o     ícone ⬇ ️, clique para instalar as dependências. ou

3. **Atualize as Dependências**: Execute o seguinte comando para atualizar as dependências listadas no arquivo `pubspec.yaml`:
    ```bash
    flutter pub get
    ```

4. **Verifique as Dependências**: Após a execução do comando acima, todas as dependências especificadas no arquivo `pubspec.yaml` serão baixadas e instaladas em seu projeto.

5. **Execute o Aplicativo**: Após a instalação das dependências, você pode executar o aplicativo em um emulador ou dispositivo conectado usando o comando:
    ```bash
    flutter run
    ```

### Chaves e Tokens

1. **Chave de Acesso ao Clima da Cidade**: É necessário obter uma chave (key) no seguinte link  https://openweathermap.org/api  para acessar os dados de temperatura da cidade. Esta chave será utilizada para integrar o aplicativo com a fonte de dados meteorológicos e fornecer informações precisas sobre as condições climáticas.

2. **Token de Acesso ao Diagnóstico de Doenças do Tomateiro**: Será preciso um token de acesso pode ser obtido criando uma conta no seguinte link https://huggingface.co/ para utilizar o recurso de diagnóstico de doenças do tomateiro através do detector de doenças integrado ao aplicativo.


Certifique-se de fornecer a chave e o token corretamente no aplicativo.
