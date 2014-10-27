import java.util.*;
import processing.serial.*;


Serial myPort;
int val;
JSONObject sun;
int barSize = 25;
int startY = 80;


void setup() {
  size(500, 300);
  myPort = new Serial(this,"/dev/ttyUSB1",9600);

String queries[]= { "internet+of+things", "data", "smart+grid"};
//String queries[]= {"internet+of+things", "big+data", "Adele"};
//String queries[]= {"Massachusetts+Institute+of+Technology", "big+data", "Adele"};
//String queries[]= {"LadyGaga", "Tom+Petty", "Adele"};
color[] colors= {#FF0000, #00FF00, #0000FF}; //R,G,B
  
 for (int i=0; i < queries.length; i++){
  int freq = getCount(queries[i]);
  fill(colors[i]);
  rect(0,startY+(barSize*i),freq/50,barSize);
  
 }
 println("index_1 = " + getCount(queries[0]));
 println("index_2 = " + getCount(queries[1]));
 println("index_3 = " + getCount(queries[2]));
 
 //return max
 int total[]={getCount(queries[0]), getCount(queries[1]), getCount(queries[2])};
 //returnMaxFromList(total);
 
 int maxNum = returnMaxFromList(total);
 println("maxNum = "+ maxNum);
 
 //if the max is at index, write to port
 if(maxNum == getCount(queries[0])){
  myPort.write('A'); 
 } 
 if (maxNum == getCount(queries[1])){
   myPort.write('B'); 
 } else {
   myPort.write('C');
 }

}


void draw() {
}

/*how many times a word is published for a particular day of the week. i.e Sunday
  json array -> Sunday[0], Friday[1], Thurs[2], Wed[3], Sat[4]
*/
int getCount(String query) {
  JSONObject jsonRequest = loadJSONObject("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=" + query + "&facet_field=day_of_week&api-key=sample-key");
  JSONObject facetValues = jsonRequest.getJSONObject("response").getJSONObject("facets").getJSONObject("day_of_week");
  JSONArray facetValuesArray = facetValues.getJSONArray("terms"); 

  int sunTotal = 0;

  sun = facetValuesArray.getJSONObject(0);
  sunTotal = sun.getInt("count");

  //print(" Sunday Count for " + query + " = " + sunTotal + "; ");
  return sunTotal;
}

int returnMaxFromList(int numbers[]){
 int max = Integer.MIN_VALUE;
 for(int i=0; i < numbers.length; i++){
    if(numbers[i] > max){
      max = numbers[i];
    }   
 } 
   //print("Max # in list = " + max);
   return max;
}


