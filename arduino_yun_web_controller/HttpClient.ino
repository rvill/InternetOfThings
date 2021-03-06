//GET request from custom api

#include <Bridge.h>
#include <HttpClient.h>

void setup() {
  pinMode(13, OUTPUT);
  digitalWrite(13, LOW);
  Bridge.begin();
  Serial.begin(9600);
  while(!Serial);
}

void loop() {
  HttpClient client;
  client.get("rvill.scripts.mit.edu:5000/");

  while (client.available()) {
    char c = client.read();
    Serial.print(c);
  }
  Serial.flush();
  delay(5000);
}
