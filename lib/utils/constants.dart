
import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Museo Moderno',
  fontSize: 100.0,
  fontWeight: FontWeight.w700,
);

const kSmallTextStyle = TextStyle(
  fontFamily: 'Museo Moderno',
  fontSize: 14.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Museo Moderno',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.w400,
  fontFamily: 'Museo Moderno',
);

const kConditionTextStyle = TextStyle(
  fontSize: 16.0,
  fontFamily: 'Museo Moderno',
  color: Colors.black,
);

const kConditionTextStyleSmall = TextStyle(
  fontSize: 9.0,
  fontFamily: 'Museo Moderno',
  color: Color(0xFF9C9C9C),
);


const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    fontFamily: 'Museo Moderno',
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(24.0),
    ),
    borderSide: BorderSide.none,
  ),
);
