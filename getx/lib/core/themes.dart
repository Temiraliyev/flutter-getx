// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:getx/core/utils.dart';

const primaryColor = Color(0xFFFF0A81); //0xFF009AD1
const grayColor = Color(0xFF666666);
const colorAccent = Color.fromARGB(255, 230, 246, 244);
const lightGray = Color(0xFFcccccc);

BoxShadow shadow = BoxShadow(
  color: Colors.grey.withOpacity(0.2),
  spreadRadius: 0.4,
  blurRadius: 1,
  offset: const Offset(0, 1),
);
ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  tabBarTheme: const TabBarTheme(
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: primaryColor, width: 2),
    ),
  ),
  brightness: Brightness.light,
  primaryColor: primaryColor,
  secondaryHeaderColor: Colors.black12,
  dividerColor: lightGray,
  fontFamily: 'Montserrat',
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: Colors.black87, fontSize: 12),
    bodyMedium: TextStyle(color: Colors.black87, fontSize: 16),
    bodyLarge: TextStyle(color: Colors.black87, fontSize: 20),
    titleMedium: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    headlineLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 0,
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: false,
  tabBarTheme: const TabBarTheme(
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: Color(0xFF009AD1), width: 2),
    ),
  ),
  brightness: Brightness.dark,
  primaryColor: Color(0xFF009AD1),
  secondaryHeaderColor: Colors.white12,
  dividerColor: HexColor.fromHex("#515151"),
  fontFamily: 'Montserrat',
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: Colors.white, fontSize: 12),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
    bodyLarge: TextStyle(color: Colors.white, fontSize: 20),
    titleMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    headlineLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  ),
  scaffoldBackgroundColor: HexColor.fromHex("#121212"),
  appBarTheme: AppBarTheme(backgroundColor: HexColor.fromHex("#121212")),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor.fromHex("#121212"),
    elevation: 0,
  ),
);
