
import processing.serial.*;


Serial myPort;
JSONObject json;
JSONObject results;
float getTempF;
JSONObject current_observation;
String stateAbbrev;
String city;


void setup() {
  
  myPort = new Serial(this,"/dev/ttyUSB0",9600);

  stateAbbrev = "MA";
  city = "Boston";
  json = loadJSONObject("http://api.wunderground.com/api/f2ef0c5186897b33/conditions/q/" +stateAbbrev +"/" + city + ".json");
  //print(json);

  results = json.getJSONObject("response");
  current_observation = json.getJSONObject("current_observation");
  //print(current_observation);
  getTempF = current_observation.getFloat("temp_f");
  println("Current Temperature in F = " + getTempF);
  temperature();

}

void draw() {
}


  


void temperature(){
    if (getTempF < 52) {
      myPort.write('R');
    println("status = it's too cold");
  } else {
      myPort.write('G');
    println("status = it's not that bad");
  }
}
