import java.net.URL;
import java.util.*;

JSONObject resourceFields;
int getTravelDurationTraffic;
int getTravelDuration;
int val;
String BingMapsAPIkey = "ApGP7VeWukEQ9dXLutAMw7kw0KKubu97Vrx55zwZLgT_O5G2WF9zPzWQOw4WsvCi";
String startLocation="Appleton%20Street%20Somerville%20MA%2002144";
String endLocation="boston";
String distanceUnit = "mi"; //km 

public class ScheduleTask extends TimerTask{

  public ScheduleTask(){
  
  }
  
  @Override
  public void run(){
    
    getRouteInfo();
  }
  
double convertSecToMin(double seconds){
 return ((seconds % 3600)/60); 
}

//Get Bing Routes API data
void getRouteInfo(){

String url = "http://dev.virtualearth.net/REST/V1/Routes/Driving?o=json&wp.0=" + startLocation + "&wp.1=" + endLocation + "&distanceUnit="+ distanceUnit + "&key=" + BingMapsAPIkey;
print(url);



JSONObject jsonRequest = loadJSONObject(url);
//print(jsonRequest);

JSONArray getResourceSets = jsonRequest.getJSONArray("resourceSets");

//Bing's JSON structure has a nested object array.
JSONArray resources = getResourceSets.getJSONObject(0).getJSONArray("resources");

//Use a for-loop to iterate through an array.
//for (int i = 0; i < resources.size(); i++) {
   resourceFields = resources.getJSONObject(0);
   getTravelDurationTraffic =  resourceFields.getInt("travelDurationTraffic");
   getTravelDuration = resourceFields.getInt("travelDuration");
   String getTrafficCongestion = resourceFields.getString("trafficCongestion");
  
  
  println("Travel w/ traffic = " + convertSecToMin(getTravelDurationTraffic) + " mins.");
  println("Travel duration w/out traffic = " + convertSecToMin(getTravelDuration) + " mins.");
  println("Traffic Congestion = " + getTrafficCongestion);
  

//}


  //If the difference between travel time and travel time w/traffic is less than 15 minutes, we're good to go.
  //Boston's avg. commute time = 29.2 mins. 
  
  double diff = getTravelDurationTraffic - getTravelDuration;
  println("Difference = " + convertSecToMin(diff) + " mins.");
  if(diff < 900){
     myPort.write('G'); //go
     print("Leave? Let's go!");
  } else {
     print("Leave? Traffic's bad, go do something else."); 
     myPort.write('S'); //stay
  } 

//println(" diff= " + (getTravelDurationTraffic - getTravelDuration));
//print(getResourceSets.getJSONObject(0).getJSONArray("resources"));
//print(resources);
  
}



}
