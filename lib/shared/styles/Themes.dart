

import 'package:f_project/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme =ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      unselectedItemColor: Colors.grey,
      elevation: 20,
      backgroundColor: Colors.white),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: defaultColor),
  textTheme: TextTheme(
      headline6: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black),
    headline3: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.black),

  ),
    fontFamily: 'Roboto'

);
ThemeData darkTheme =ThemeData(
  scaffoldBackgroundColor: HexColor('333739'),
  primarySwatch: defaultColor,
  appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarIconBrightness: Brightness.light),
      backgroundColor: defaultColor,
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      unselectedItemColor: Colors.grey,
      elevation: 20,
      backgroundColor: HexColor('102030')),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: defaultColor),
  textTheme: TextTheme(
      headline6: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    headline3: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white),

  ),
  fontFamily: 'Roboto'

);