char val;

int greenPin = 4;
int redPin = 6; 

void setup(){
 pinMode(greenPin, OUTPUT);
 pinMode(redPin, OUTPUT); 
 Serial.begin(9600);
}

void loop(){
 if(Serial.available()){
  val=Serial.read();
 }

if (val == 'G'){  //Go
  digitalWrite(greenPin, HIGH);
  Serial.print(val);
} else {
  digitalWrite(greenPin, LOW); 
}

if (val == 'S'){ //Stay
  digitalWrite(redPin, HIGH);
  Serial.print(val);
} else {
  digitalWrite(redPin, LOW); 
}
  
}
