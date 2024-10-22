import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:math';
// import 'gra';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  var username;

  // Async - Function starts but returns after some delay
  // Future.delayed - Function starts after delay.

  @override
  // int counter = 1;
  void initState() {
    super.initState();
    // getData();
    print("This is a init state");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set state called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widget destroyed");
  }

  @override
  Widget build(BuildContext context) {
    var city_name = [
      "Pali",
      "Jodhpur",
      "Udaipur",
      "Jaipur",
      "Mumbai",
      "Delhi",
      "London"
    ];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;
    String temp = ((info?['temp_value']).toString());
    String air = ((info?['air_speed_value']).toString());
    if(temp == "NA"){
      print("NA");
    }
    else{
    temp = ((info?['temp_value']).toString()).substring(0,4);
    air = ((info?['air_speed_value']).toString()).substring(0,4);
    }

    String icon = ((info?['icon_value']).toString());
    String getCity = ((info?['city_value']).toString());
    String hum = ((info?['hum_value']).toString());

    String des = ((info?['des_value']).toString());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.red,
        ),
      ),
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment.centerLeft,
      //         end: Alignment.centerRight,
      //         colors: <Color>[
      //           Colors.redAccent,
      //           Colors.lightBlueAccent,
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                // stops: [    //this is used to adjust the gradient along the screen
                //   0.1,      //10% of screen blue
                //   0.3,      //20 - 30% transition , 30 to 100% screen pink
                // ],
                colors:[
                  Colors.lightBlueAccent,
                  Colors.lightBlueAccent,
                ],
              )
            ),
            child: Column(
              children: <Widget>[
                Container(
                    //Search wala container
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            if((searchController.text).replaceAll(" ", "") == ""){
                              print("blank search");
                            }
                            else{
                              Navigator.pushReplacementNamed(context, "/Loading",arguments: {
                                "searchText" : searchController.text,
                              });
                            }
                          },
                          child: Container(
                            child: Icon(
                              Icons.search_outlined,
                              color: Colors.lightBlueAccent,
                            ),
                            margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search $city",
                            ),
                          ),
                        ),
                      ],
                    )),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.all(25),
                        child: Row(
                          children: [
                          Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
                          SizedBox(width: 15),
                          Column(
                            children: [
                              Text("$des",style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                              Text("$getCity",style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),)
                            ],
                          ),
                        ],),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 230,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                        padding: EdgeInsets.all(28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$temp",style: TextStyle(
                                  fontSize: 100,
                                  fontWeight: FontWeight.bold,
                                ),),
                                Icon(
                                  Icons.circle_outlined ,
                                  size: 10.0,
                                ),
                                Text("C",style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.normal,),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.fromLTRB(20,0,10,0),
                        padding: EdgeInsets.all(28),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.cloudy_windy),
                              ],
                            ),
                            SizedBox(height: 18,),
                            Text("$air",style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),),
                            Text("Km/hour",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),)
                          ],
                        ),
                        height: 190,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.fromLTRB(10,0,20,0),
                        padding: EdgeInsets.all(28),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity),
                              ],
                            ),
                            SizedBox(height: 18,),
                            Text("$hum",style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),),
                            Text("Percent",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),)
                          ],
                        ),
                        height: 190,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 120,),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Weather Information provided by OpenWeatherMap.org",style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),)
                    ],
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
