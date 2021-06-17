import 'package:career_road/components/bottomNavBar.dart';
import 'package:career_road/utilities/constants.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _bottomNavIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Quiz')),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: kBackgroundColor,
      body: Container(
        child: Text('Quiz time'),
      ),
      bottomNavigationBar: BottomNavBar(bottomNavIndex: _bottomNavIndex),
    );
  }
}
