char val;

int arrayIndex0_pin = 12;
int arrayIndex1_pin = 10;
int arrayIndex2_pin = 8;

void setup(){
 pinMode(arrayIndex0_pin, OUTPUT); 
 pinMode(arrayIndex1_pin, OUTPUT); 
 pinMode(arrayIndex2_pin, OUTPUT); 
 Serial.begin(9600);
}

void loop(){
 if(Serial.available()){
  val= Serial.read();
  //Serial.print(val);
 } 
 if (val == 'A'){
   digitalWrite(arrayIndex0_pin, HIGH);
  // Serial.println(val);
 } else {
     digitalWrite(arrayIndex0_pin, LOW);   
 }
 
  if (val == 'B'){
   digitalWrite(arrayIndex1_pin, HIGH);
  //  Serial.println(val);
 } else {
     digitalWrite(arrayIndex1_pin, LOW);   
 }
 
   if (val == 'C'){
   digitalWrite(arrayIndex2_pin, HIGH);
   // Serial.println(val);
 } else {
     digitalWrite(arrayIndex2_pin, LOW);   
 }
  
}

