import 'dart:html';
import 'package:career_road/components/bottomNavBar.dart';
import 'package:career_road/components/searchBar.dart';
import 'package:flutter/material.dart';
import 'package:career_road/utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  static final formKey = new GlobalKey<FormState>();
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController _controller = TextEditingController();
    String introText = """\n
          Welcome To Career Road  this app will help you find and build your career 
          by providing its road map and related learning sources. 
          Assisting you in your self-learning process. We wish you Happy Learning.
          Regards,
          Career Road Team""";
    int _bottomNavIndex = 1;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home')),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width / 20, vertical: size.height / 20),
            child: Container(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      child: Text(
                        'Career Road',
                        style: kTitleStyle,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(introText, style: kLabelStyle),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Form(key: HomeScreen.formKey, child: SearchBar()),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(bottomNavIndex: _bottomNavIndex),
    );
  }
}
