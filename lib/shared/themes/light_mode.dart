import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightThem() {
  return ThemeData(
    
    primarySwatch: Colors.deepPurple,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      color: Colors.purple,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white10,
        statusBarIconBrightness: Brightness.dark,
      ),

      titleSpacing: 20,
      titleTextStyle: TextStyle(
        
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.pinkAccent,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: Colors.deepOrangeAccent,
      ),
      elevation: 20,
    ),
    scaffoldBackgroundColor: Colors.purple,
  );
}
