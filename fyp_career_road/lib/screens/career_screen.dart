import 'package:fyp_career_road/components/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:fyp_career_road/utilities/constants.dart';
import '../utilities/constants.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CareerScreen extends StatefulWidget {
  @override
  _CareerScreenState createState() => _CareerScreenState();
}

class _CareerScreenState extends State<CareerScreen> {
  @override
  Widget build(BuildContext context) {
    int _bottomNavIndex = 2;
    int _selectedIndex = 0;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Center(child: Text('Career Info')),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          GNav(
            haptic: true,
            tabs: [
              GButton(
                icon: Icons.alternate_email,
                text: 'Info',
                textStyle: kLabelStyle,
                iconColor: Colors.white,
                iconActiveColor: Colors.white,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
              ),
              GButton(
                icon: Icons.map,
                text: 'Roadmap',
                textStyle: kLabelStyle,
                iconColor: Colors.white,
                iconActiveColor: Colors.white,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
              GButton(
                icon: Icons.forum,
                text: 'Forum',
                textStyle: kLabelStyle,
                iconColor: Colors.white,
                iconActiveColor: Colors.white,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Container(child: Text(_selectedIndex.toString()))
        ],
      ),
      bottomNavigationBar: BottomNavBar(bottomNavIndex: _bottomNavIndex),
    );
  }
}
