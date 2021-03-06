import 'package:flutter/material.dart';
import 'package:fyp_career_road/screens/add_career_screen.dart';
import 'package:fyp_career_road/screens/remove_career_screen.dart';
import '../models/constants.dart';
import 'package:fyp_career_road/components/bottomNavBar.dart';

class EditCareerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _bottomNavIndex = 4;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Menu')),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(
                'Add Career',
                style: kLabelStyle,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddCareerScreen()));
              },
            ),
            ElevatedButton(
              child: Text(
                'Remove Career',
                style: kLabelStyle,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RemoveCareerScreen()));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(bottomNavIndex: _bottomNavIndex),
    );
  }
}
