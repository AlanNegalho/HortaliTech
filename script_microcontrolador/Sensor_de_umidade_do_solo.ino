#define sinal A0

int valor;
int umidade;

void setup() {
  Serial.begin(9600);
  pinMode(sinal, INPUT);
}

void loop() {
  // Lê o valor do pino A0 do sensor
  valor = analogRead(sinal);

  // Mapeia o valor lido para o intervalo de 0 a 100 (0 como solo seco, 100 como solo molhado)
  umidade = map(valor, 0, 1023, 100, 0);

  // Mostra o valor da umidade no serial monitor
  Serial.println(umidade);

  // Aguarda 1 segundo
  delay(1000);
}