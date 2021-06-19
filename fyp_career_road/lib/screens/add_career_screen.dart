import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/bottomNavBar.dart';
import '../utilities/constants.dart';
import 'menu_screen.dart';

// In flutter, controllers are a means to give control to the parent widget over its child state
class AddCareerScreen extends StatefulWidget {
  @override
  _AddCareerScreenState createState() => _AddCareerScreenState();
}

class _AddCareerScreenState extends State<AddCareerScreen> {
  // final AuthService _auth = AuthService();
  String _name = '';

  String _info = '';
  String _roadMap = '';
  String _link = '';
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int _bottomNavIndex = 4;

    // String _confirmPassword = '';

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Add Career')),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05, vertical: size.height / 50),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height / 15,
                ),

                // NAME TEXT FIELD
                Container(
                  height: 50,
                  // margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: kBoxDecorationStyle,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15.0),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                      ),
                      hintText: "Enter Career Name",
                      hintStyle: kHintTextStyle,
                    ),
                    validator: (str) {
                      if (str.isEmpty) {
                        return 'Name cannot be left empty';
                      }
                      return null;
                    },
                    onChanged: (str) {
                      setState(() {
                        _name = str;
                      });
                    },
                  ),
                ),
                SizedBox(height: size.height / 32),

                // EMAIL TEXT FIELD
                Container(
                  height: 50,
                  decoration: kBoxDecorationStyle,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15.0),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: Colors.white,
                      ),
                      hintText: "Enter Career Info",
                      hintStyle: kHintTextStyle,
                    ),
                    validator: (str) {
                      if (str.isEmpty) {
                        return 'Info is required';
                      }
                      return null;
                    },
                    onChanged: (str) {
                      setState(() {
                        _info = str;
                      });
                    },
                  ),
                ),
                SizedBox(height: size.height / 32),

                // PASSWORD TEXT FIELD
                Container(
                  height: 50,
                  decoration: kBoxDecorationStyle,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15.0),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      hintText: "Enter Roadmap",
                      hintStyle: kHintTextStyle,
                    ),
                    obscureText: true,
                    validator: (str) {
                      if (str.isEmpty) {
                        return 'Roadmap cannot be left empty';
                      }
                      return null;
                    },
                    onChanged: (str) {
                      setState(() {
                        _roadMap = str;
                      });
                    },
                  ),
                ),
                SizedBox(height: size.height / 32),

                // CONFIRM PASSWORD TEXT FIELD
                Container(
                  height: 50,
                  decoration: kBoxDecorationStyle,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15.0),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      hintText: "Enter Link",
                      hintStyle: kHintTextStyle,
                    ),
                    obscureText: true,
                    validator: (str) {
                      if (str.isEmpty) {
                        return 'Link cannot be left empty';
                      }
                      return null;
                    },
                    onChanged: (str) {
                      setState(() {
                        _link = str;
                      });
                    },
                  ),
                ),
                SizedBox(height: size.height / 22),
                SizedBox(height: size.height / 22),
                Container(
                  width: size.width,
                  height: size.height / 14,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () async {
                      // Validate returns true if the form is valid, otherwise false.
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.

                        // QUERY TO DELETE

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Menu(),
                          ),
                        );
                      }

                      // register(context);
                    },
                    child: Text(
                      'Confirm',
                      style: kLabelStyle,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(bottomNavIndex: _bottomNavIndex),
    );
  }

// register(BuildContext context) async {
//   String message = await AuthenticationService()
//       .signUp(full_name: _name, email: _email, password: _password);
//   Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
// }
}
