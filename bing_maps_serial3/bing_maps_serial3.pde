import processing.serial.*;
import java.util.*;


Serial myPort;

void setup() {

  myPort = new Serial(this, "/dev/ttyUSB0", 9600);
  Timer timer = new Timer();

  //wait 1 second, and then again every 5 minutes (30,000 milli-seconds)
  timer.schedule(new ScheduleTask(), 1000, 300000);

  //Uncomment to see results faster: Wait 1 second and then again every 5 seconds
  //timer.schedule(new ScheduleTask(), 1000, 5000);
}


void draw() {
