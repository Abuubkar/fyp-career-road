import 'package:flutter/material.dart';
import 'package:fyp_career_road/components/customTextFields.dart';
import 'package:fyp_career_road/services/firestore.dart';

import '../components/bottomNavBar.dart';
import '../components/customTextFields.dart';
import '../utilities/constants.dart';

class RemoveCareerScreen extends StatefulWidget {
  @override
  _RemoveCareerScreenState createState() => _RemoveCareerScreenState();
}

class _RemoveCareerScreenState extends State<RemoveCareerScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
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
                    hint: "Enter Career Name",
                    icons: Icons.delete_forever,
                    textInputType: TextInputType.text,
                    lableText: "",
                    controller: _idController,
                  ),
                  ElevatedButton(
                    child: Text(
                      '   Delete   ',
                      style: kLabelStyle,
                    ),
                    onPressed: deletePressed,
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

  void deletePressed() async {
    _idController.text = _idController.text.trim();
    if (_idController.text != null && _idController.text.isNotEmpty) {
      print(_idController.text);
      Database.removeCareer(_idController.text);
    }
  }
}
