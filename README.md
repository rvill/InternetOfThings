InternetOfThings
================

Web services meets hardware.

This Arduino+Processing project communicates with the Bing Routes API, NY Times API, and Accuweather API in JSON format.
For testing purposes, the project uses LEDs to confirm succesful communication between Arduino,Processing, and the REST service 

**Using the Bing Routes API**(to determine whether a  route contains congested traffic  or not) i.e. redLED=congested; greenLED=clear 
Arduino code: bing_maps_arduino_serial2;
Processing code: bing_maps_serial2

**Using the Weather API**
Arduino code: weather_serial;
Processing code: weather

**Using the NY Times API** (to determine how often an array of phrases are used on a particular day of week)
Arduino code: nytimes_ff_arduino_serial;
Processing code: nytimes_facet_filter_serial

