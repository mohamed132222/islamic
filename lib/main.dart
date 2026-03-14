import 'package:flutter/material.dart';
import 'package:quran_app/MyTheme.dart';
import 'package:quran_app/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.lightTheme,
      routes: {HomeScreen.routeName: (context) => HomeScreen()},
    );
  }
}
