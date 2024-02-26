import 'package:flutter/material.dart';

const kLabelTextStyle = TextStyle(
  fontSize: 25.0,
);

const kTempTextStyle = TextStyle(
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
);

const kConditionTextStyle = TextStyle(
  fontSize: 85.0,
);

const kTextFieldInputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
  hintText: 'Enter city name',
  filled: true,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
);
