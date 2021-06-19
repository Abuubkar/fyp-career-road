import 'package:flutter/material.dart';
import 'package:fyp_career_road/components/customTextFields.dart';

import '../components/bottomNavBar.dart';
import '../components/customTextFields.dart';
import '../utilities/constants.dart';

class RemoveCareerScreen extends StatefulWidget {
  @override
  _RemoveCareerScreenState createState() => _RemoveCareerScreenState();
}

class _RemoveCareerScreenState extends State<RemoveCareerScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    int _bottomNavIndex = 4;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Menu')),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.height / 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                      hint: "Enter Career ID",
                      icons: Icons.delete_forever,
                      textInputType: TextInputType.text,
                      lableText: ""),
                  ElevatedButton(
                    child: Text(
                      '   Delete   ',
                      style: kLabelStyle,
                    ),
                    onPressed: () {
                      // DELETE THE COURSE ID
                    },
                  ),
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
