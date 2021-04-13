import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    primarySwatch: Colors.indigo,
    accentColor: Colors.tealAccent,
    backgroundColor: Colors.grey[200],
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Lato',
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.black,
    ),
    textTheme: const TextTheme(
      // set TextStyle for headlines
      headline1: TextStyle(
        fontSize: 101,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
      headline2: TextStyle(
        fontSize: 63,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      ),
      headline3: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.w400,
      ),
      headline4: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      headline5: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
      headline6: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      subtitle1: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      ),
      subtitle2: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyText1: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyText2: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      button: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        color: Colors.white,
      ),
      caption: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      overline: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
      ),
    ),
  );
}
