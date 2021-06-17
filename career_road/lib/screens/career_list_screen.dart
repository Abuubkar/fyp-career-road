import 'package:career_road/components/bottomNavBar.dart';
import 'package:career_road/screens/career_screen.dart';
import 'package:flutter/material.dart';
import 'package:career_road/utilities/constants.dart';
import '../utilities/constants.dart';

class CareerListScreen extends StatefulWidget {
  @override
  _CareerListScreenState createState() => _CareerListScreenState();
}

class _CareerListScreenState extends State<CareerListScreen> {
  @override
  Widget build(BuildContext context) {
    int _bottomNavIndex = 2;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Center(child: Text('Courses')),
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CareerScreen()));
                    });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(bottomNavIndex: _bottomNavIndex),
    );
  }
}
