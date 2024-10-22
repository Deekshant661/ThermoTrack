// class - different method
//instance -different data
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class worker
{
   worker({this.location});   //{] makes it a named parameter.
   // {
   //    location = this.location;
   // }

   var location;
   var temp;
   var humidity;
   var airSpeed;
   var description;
   var main;
   var icon;

   //method
   Future<void> getData() async
   {
      try{
         http.Response response = await http.get(Uri.parse('http://api.openweathermap.org/data/2.5/weather?q=$location&appid=eb7269326231a932f2e55f5645e55c2d'));
         Map data = jsonDecode(response.body);

         //temp,humidity,
         Map temp_data = data['main'];
         String getHumidity = temp_data['humidity'].toString();
         double getTemp = temp_data['temp'] - 273.15;
         print(data);

         //getting air speed
         Map wind = data['wind'];
         double getAir_speed = wind['speed'] / 0.277777778;

         //getting description
         print("$temp");
         List weather_data = data['weather'];
         Map weather_main_data = weather_data[0];
         var weatherMain = weather_main_data['main'];
         String getMain_des = weather_main_data['main'];
         String getDesc = weather_main_data['description'];



         //Assigning values
         temp = getTemp.toString(); // c
         humidity = getHumidity;  // %
         airSpeed = getAir_speed.toString();    // km/hr
         description = getDesc;
         main = getMain_des;
         icon = weather_main_data["icon"].toString();


      }
      catch(e)
      {
         print(e);
         temp = "NA";
         humidity = "NA";
         airSpeed = "NA";
         description = "404 , Data not found.";
         main = "NA";
         icon = "09d";
      }


   }

}


