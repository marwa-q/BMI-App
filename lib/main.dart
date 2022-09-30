import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'home.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData(primaryColor: Colors.teal),
      home: EasySplashScreen(
        logo: Image.asset("assets/images/bmi.png"),
        backgroundColor: Colors.teal,
        title: const Text('Welcome to BMI calculator'),
        navigator: const Home(),
      ),
    );
  }
}
