int ledPin = 13; 
void setup() { 
  pinMode(ledPin, OUTPUT); 
  Serial.begin(9600); 
} 
void loop() { 
  if (Serial.available() > 0) { 
    String command = Serial.readStringUntil('\n'); 
    command.trim(); 
    if (command == "on") { 
      digitalWrite(ledPin, HIGH); 
      Serial.println("LED ON"); 
    } else if (command == "off") { 
      digitalWrite(ledPin, LOW); 
      Serial.println("LED OFF"); 
    } 
  } 
}