
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_application/utils/constants.dart';

import '../utils/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  CityScreenState createState() => CityScreenState();
}

class CityScreenState extends State<CityScreen> {
  String cityName='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topLeft,

                  //TODO On Click TO Back Icon
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    //TODO Back Icon
                    child: Image.asset(
                      'images/ic_back.png',
                      width: 32.0,
                    ),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(

                  style: TextStyle(
                    fontFamily: 'Museo Moderno',
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),

                    hintText: 'Enter Your City',
                    hintStyle: TextStyle(
                      fontFamily: 'Museo Moderno',
                      color: Colors.grey,
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide.none,
                    )
                  ),
                  onChanged: (value){
                    cityName=value;
                  },

                ),
              ),

              //TODO Search Icon Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                ),
                onPressed: () {
                  Navigator.pop(context,cityName);
                },
                child: Text(
                  'Search Weather',
                  style: kButtonTextStyle,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
