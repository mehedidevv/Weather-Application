
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:weather_application/services/weather.dart';
import 'package:weather_application/utils/custom_paint.dart';
import 'package:weather_application/screens/city_screen.dart';
import 'package:weather_application/utils/constants.dart';
import 'package:weather_application/utils/custom_paint.dart';

import '../utils/constants.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {

  final locationWeather;

  const LocationScreen({super.key, this.locationWeather});

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {

  late int temparature;
  late int minTemparature;
  late int maxTemparature;
  late double windSpeed;
  late int humidity;
  late String cityName;
  //int temparture=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    updateUI(widget.locationWeather);
  }

  //TODO Load Data To UI
  void updateUI(dynamic weatherData){

   setState(() {
     var data=widget.locationWeather;
     double temp=weatherData['main']['temp'];
     temparature=temp.toInt();
     double minTemp=weatherData['main']['temp_min'];
     minTemparature=minTemp.toInt();
     double maxTemp=weatherData['main']['temp_max'];
     maxTemparature=maxTemp.toInt();

     humidity=weatherData['main']['humidity'];
     windSpeed=weatherData['wind']['speed']*3.6;
     cityName=weatherData['name'];
   });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.09),
              BlendMode.darken,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.only(
                  top: 24,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Expanded(
                      child: Text(
                        '$temparature°',
                        style: kTempTextStyle,
                      ),
                    ),

                    //TODO On Top Location Icon
                    GestureDetector(
                      onTap: () {
                        var weatherData=WeatherModel().getLocationWeather();
                        updateUI(weatherData);
                      },
                      child: Image.asset(
                        'images/ic_current_location.png',
                        width: 32.0,
                      ),
                    ),

                    SizedBox(width: 24.0),

                    //TODO On Top Search Icon
                    GestureDetector(
                      onTap: () async{
                        var typedName=await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CityScreen(),
                          ),
                        );

                        if(typedName!=null){
                          //City Name Here
                          var weatherdata=await WeatherModel().getCityWeather(typedName);
                          updateUI(weatherdata);
                        }

                      },
                      child: Image.asset(
                        'images/ic_search.png',
                        width: 32.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: 16.0),

                    //TODO Current Location Icon
                    Image.asset(
                      'images/ic_location_pin.png',
                      width: 24.0,
                      height: 24.0,
                    ),

                    SizedBox(width: 10),

                    //TODO TextView Dhaka
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        '$cityName',
                        textAlign: TextAlign.center,
                        style: kSmallTextStyle.copyWith(
                          fontSize: 16.0,
                          color: Colors.black45,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 190,
                child: CustomPaint(
                  painter: MyCustomPaint(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 24.0,
                          bottom: 24.0,
                        ),
                        child: Text(
                          'Weather Today',
                          style: kConditionTextStyle.copyWith(fontSize: 16.0),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          conditionRow(
                            icon: 'images/ic_temp.png',
                            tittle: 'Min Temp',
                            value: '$minTemparature°',
                          ),
                          conditionRow(
                            icon: 'images/ic_wind_speed.png',
                            tittle: 'Wind Speed',
                            value: '${windSpeed.toStringAsFixed(1)} Km/h',
                          ),
                          conditionRow(
                            icon: 'images/ic_temp.png',
                            tittle: 'Max Temp',
                            value: '$maxTemparature°',
                          ),
                          conditionRow(
                            icon: 'images/ic_humidity.png',
                            tittle: 'Humidity',
                            value: '$humidity%',
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )

            ],
                  ),
                ),
              )
          );

  }
}

//ConditionRow Stateless Widget
class conditionRow extends StatelessWidget {
  final String icon;
  final String tittle;
  final String value;

  const conditionRow({super.key, required this.icon, required this.tittle, required this.value});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          icon,
          width: 24.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
        ),

          Text(
            tittle,
            style: kConditionTextStyleSmall,
          ),

        Text(
          value,
          style: kConditionTextStyle,
        )
      ],
    );
  }
}

