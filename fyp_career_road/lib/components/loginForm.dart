import 'package:fyp_career_road/screens/signup_screen.dart';
// import 'package:career_road/services/flutterFire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_career_road/services/authentication.dart';
import 'package:fyp_career_road/utilities/constants.dart';
import 'package:fyp_career_road/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../utilities/constants.dart';

// In flutter, controllers are a means to give control to the parent widget over its child state
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _email = '';

  String _password = '';
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login', style: kTitleStyle),
            SizedBox(
              height: size.height / 15,
            ),

            // NAME TEXT FIELD

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
                  hintText: "Enter your Email",
                  hintStyle: kHintTextStyle,
                ),
                validator: (str) {
                  if (str.isEmpty) {
                    return 'Email is required';
                  }
                  // else if (str.contains(' ')) {
                  //   return 'Email cannot contain space';
                  // }
                  return null;
                },
                onChanged: (str) {
                  setState(() {
                    _email = str;
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
                  hintText: "Enter your Password",
                  hintStyle: kHintTextStyle,
                ),
                obscureText: true,
                validator: (str) {
                  if (str.isEmpty) {
                    return 'Password cannot be left empty';
                  } else if (str.contains(' ')) {
                    return 'Password cannot contain space';
                  }
                  _password = str;
                  return null;
                },
                onChanged: (str) {
                  setState(() {
                    _password = str;
                  });
                },
              ),
            ),
            SizedBox(height: size.height / 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupScreen(),
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      'Signup Instead',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
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

                    String shouldNavigate = await context
                        .read<AuthenticationService>()
                        .signIn(email: _email, password: _password);

                    if (shouldNavigate == "Signed In") {
                      print(shouldNavigate);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    } else {
                      Alert(
                        context: context,
                        title: 'Error',
                        // and display its name
                        desc: shouldNavigate,
                      ).show();
                    }
                  }

                  // register(context);
                },
                child: Text(
                  'Login',
                  style: kLabelStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

// register(BuildContext context) async {
//   String message = await AuthenticationService()
//       .signUp(full_name: _name, email: _email, password: _password);
//   Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
// }
}
