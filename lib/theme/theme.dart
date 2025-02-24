import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 14.0,
        color: Color(0xFFA9A9A9),
      ),
      headlineMedium: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w800,
        fontSize: 18.0,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
        color: Color(0xff4AB7C3),
      ),
      titleLarge: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
        color: Colors.black,
      ),
    ),
    fontFamily: 'Poppins');
