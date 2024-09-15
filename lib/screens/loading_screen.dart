
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_application/screens/location_screen.dart';
import 'package:weather_application/services/location.dart';
import 'package:weather_application/services/network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_application/services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  LoadingScreenState createState() => LoadingScreenState();
}

const apiKEY="7895640c2d6eab69b7747365d437a53a";

class LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //TODO Call GetLocation Method From Location Class
     getWeatherLocationData();
  }

  //TODO Method Location Class
  void getWeatherLocationData() async{

   var weatherData= await WeatherModel().getLocationWeather();

   //TODO Navigator
    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(
      locationWeather: weatherData,
    )));
  }



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.09), BlendMode.darken),
          )
        ),

        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 150,
          ),
        ),
      ),
      );
  }
}
