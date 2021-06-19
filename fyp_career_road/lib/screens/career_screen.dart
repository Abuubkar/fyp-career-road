import 'package:flutter/material.dart';
import 'package:fyp_career_road/components/bottomNavBar.dart';
import 'package:fyp_career_road/models/career_entity.dart';
import 'package:fyp_career_road/utilities/constants.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../utilities/constants.dart';

class CareerScreen extends StatefulWidget {
  final CareerEntity career;

  const CareerScreen(this.career);
  @override
  _CareerScreenState createState() => _CareerScreenState();
}

class _CareerScreenState extends State<CareerScreen> {
  int _bottomNavIndex = 2;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    print(widget.career.toJson());
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
                text: widget.career.info,
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
                text: widget.career.roadMap,
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
                text: widget.career.link,
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
