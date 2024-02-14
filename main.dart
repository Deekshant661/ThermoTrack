

import 'package:flutter/material.dart';
import 'package:temperature_exe/Activities/home.dart';
import 'package:temperature_exe/Activities/Loading.dart';


void main() {
  runApp(MaterialApp(
    routes: {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
      "/Loading" : (context) => Loading(),
    },
  ));
}


