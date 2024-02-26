import 'package:flutter/material.dart';

//Light Theme
ThemeData lightMode = ThemeData(
    fontFamily: 'BebasNeue',
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: Colors.grey.shade50,
        primary: Colors.amber.shade800,
        onPrimary: Colors.grey.shade900));
//Dark Theme
ThemeData darkMode = ThemeData(
    fontFamily: 'BebasNeue',
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Colors.grey.shade900,
        primary: Colors.amber.shade800,
        onPrimary: Colors.grey.shade50));
