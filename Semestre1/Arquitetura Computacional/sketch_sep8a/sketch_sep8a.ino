// int pinoSensorLM35 = A0;
float temperatura;
float max = 20;
float min = 8;

void setup() {
  Serial.begin(9600);
}

void loop() {
  Serial.print("tempMaxima:");
  Serial.print(max);
  Serial.print(" ");
  // temperatura = (float(analogRead(pinoSensorLM35)) * 5 / (1023)) / 0.01;
  temperatura = 14;
  Serial.print("temperatura:");
  Serial.print(temperatura);
  Serial.print(" ");
  delay(1000);
}