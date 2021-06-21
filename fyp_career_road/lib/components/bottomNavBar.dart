import 'package:fyp_career_road/screens/bookmark_screen.dart';
import 'package:fyp_career_road/screens/career_list_screen.dart';
import 'package:fyp_career_road/screens/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'file:///E:/fyp-career-road/fyp_career_road/lib/models/constants.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:fyp_career_road/screens/menu_screen.dart';
import 'package:fyp_career_road/screens/home_screen.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  int bottomNavIndex;
  BottomNavBar({this.bottomNavIndex});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: widget.bottomNavIndex,
      showElevation: true, // use this to remove appBar's elevation
      onItemSelected: (index) => setState(() {
        widget.bottomNavIndex = index;
        if (index == 0) {
          // Quiz
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuizScreen(),
              ));
        } else if (index == 1) {
          // Home
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
        } else if (index == 2) {
          // Menu
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CareerListScreen(),
              ));
        } else if (index == 3) {
          // Bookmark
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookmarkScreen(),
              ));
        } else if (index == 4) {
          // Menu
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Menu(),
              ));
        }
      }),
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.assignment),
          title: Text('Quiz'),
          activeColor: kBackgroundColor,
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: kBackgroundColor),
        // BottomNavyBarItem(
        //     icon: Icon(Icons.search),
        //     title: Text('Search'),
        //     activeColor: kBackgroundColor),
        BottomNavyBarItem(
            icon: Icon(Icons.work),
            title: Text('Career'),
            activeColor: kBackgroundColor),
        BottomNavyBarItem(
            icon: Icon(Icons.bookmark),
            title: Text('Bookmark'),
            activeColor: kBackgroundColor),
        BottomNavyBarItem(
            icon: Icon(Icons.menu),
            title: Text('Settings'),
            activeColor: Colors.blue),
      ],
    );
  }
}
