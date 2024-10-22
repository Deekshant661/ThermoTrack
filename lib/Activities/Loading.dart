import 'package:flutter/material.dart';
import 'package:temperature_exe/Activities/home.dart';
import 'package:temperature_exe/Activities/location.dart';
import 'package:temperature_exe/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  var temp;
  var humidity;
  var airSpeed;
  var des;
  var main;
  var icon;
  var city = "Pali";


  void startApp(String city) async
  {
    worker instance = worker(location: "$city");
    await instance.getData();

    temp = instance.temp;
    humidity = instance.humidity;
    airSpeed = instance.airSpeed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;
    Future.delayed(Duration(seconds: 2), () {
    Navigator.pushReplacementNamed(context, '/home',arguments:{
      "temp_value" : temp,
      "hum_value" : humidity,
      "air_speed_value" : airSpeed,
      "des_value" : des,
      "main_value" : main,
      "icon_value":icon,
      "city_value" : city,
      } );
    });
  }


  @override
  void initState(){
    super.initState();
  }
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;
    if (search?.isNotEmpty ?? false){
      city = search?['searchText'];
    }
    startApp(city);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 180,),
              Image.asset("images/download.png",height: 250,width: 250,),
              Text("ThermoTrack",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),),
              SizedBox(height: 10,),
          //SizedBox(height: 30,),
          SpinKitThreeBounce(
            color: Colors.white,
            size: 50.0,
          ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.lightBlueAccent[200],
    );
  }
}
