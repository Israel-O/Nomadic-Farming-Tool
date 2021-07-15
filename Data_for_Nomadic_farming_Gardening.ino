
int light = 0;
int photoResistorPin = A0;
#include <dht.h>
#define dht_apin A1 // Analog Pin sensor is connected to
dht DHT;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(photoResistorPin, INPUT);

}

int readLight(){
  //light = map(analogRead(photoResistorPin), 0, 255, 0, 100);
  light = map(analogRead(photoResistorPin), 0, 255, 0, 100);
  return light;
}


void loop() {
  // put your main code here, to run repeatedly:
  light = map(analogRead(photoResistorPin), 0, 1023, 0, 100);
  DHT.read11(dht_apin);
  Serial.println(DHT.humidity);
  Serial.println(DHT.temperature);
  Serial.println(light);
  delay(1000);
}
