import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darktThem() {
  return ThemeData(
    primarySwatch: Colors.deepOrange,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.grey,
      ),
      color: Colors.black87,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black45,
        statusBarIconBrightness: Brightness.light,
      ),
      titleSpacing: 20,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    scaffoldBackgroundColor: Colors.black87,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
      ),
      selectedIconTheme: IconThemeData(
        color: Colors.deepOrange,
      ),
      elevation: 20,
    ),
  );
}
