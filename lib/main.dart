import 'package:flutter/material.dart';
import 'package:islamic_app/views//alarm.dart';
import 'package:islamic_app/views//home.dart';
import 'package:islamic_app/views/splash-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

final appRoutes =   {

  'splash': (context) => SplashScreen(),
  'home': (context) => Home(),
};

