import 'package:flutter/material.dart';

class MyTheme {
  static const Color primaryColor = Color(0xffB7935F);
  static const Color primaryDarkColor = Color(0xff141A2E);
  static const Color darkColor = Color(0xff242424);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color goldColor = Color(0xffFACC1D);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(color: darkColor),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: darkColor,
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: darkColor,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: darkColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(color: whiteColor),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: whiteColor,
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: whiteColor,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(),
  );
}
