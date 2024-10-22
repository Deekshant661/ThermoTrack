

import 'package:flutter/material.dart';
import 'package:temperature_exe/Activities/home.dart';
import 'package:temperature_exe/Activities/Loading.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,  // This removes the debug banner
    routes: {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
      "/Loading" : (context) => Loading(),
    },
  ));
}


