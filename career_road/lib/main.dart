import 'package:flutter/material.dart';
import 'package:career_road/screens/signup_screen.dart';
import 'package:career_road/screens/login_screen.dart';
import 'package:career_road/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
