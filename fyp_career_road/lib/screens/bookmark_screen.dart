import 'package:fyp_career_road/components/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:fyp_career_road/utilities/constants.dart';

import '../utilities/constants.dart';

class BookmarkScreen extends StatefulWidget {
  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    int _bottomNavIndex = 3;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Center(child: Text('Bookmarks')),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text((index + 1).toString(), style: kLabelStyle),
                  title: Text("Career Name Here"),
                  trailing: Icon(Icons.delete, color: Colors.white),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(bottomNavIndex: _bottomNavIndex),
    );
  }
}
