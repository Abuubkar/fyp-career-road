import 'package:career_road/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:career_road/utilities/constants.dart';

// In flutter, controllers are a means to give control to the parent widget over its child state
class SignupForm extends StatefulWidget {
  static final _formKey = new GlobalKey<FormState>();

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  String _name = '';

  String _email = '';

  String _password = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // String _confirmPassword = '';

    return Form(
      key: SignupForm._formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('SignUp', style: kTitleStyle),
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
                hintText: "Enter your Full Name",
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
                hintText: "Enter your Email",
                hintStyle: kHintTextStyle,
              ),
              validator: (str) {
                if (str.isEmpty) {
                  return 'Email is required';
                }
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
                hintText: "Re-enter your Password",
                hintStyle: kHintTextStyle,
              ),
              obscureText: true,
              validator: (str) {
                if (str.isEmpty) {
                  return 'Confirm Password cannot be left empty';
                }

                if (str != _password) {
                  return 'Password does not Match';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: size.height / 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: Text(
                  'Login Instead',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
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
                if (SignupForm._formKey.currentState.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.

                }

                // register(context);
              },
              child: Text('Register'),
            ),
          )
        ],
      ),
    );
  }

  // register(BuildContext context) async {
  //   String message = await AuthenticationService()
  //       .signUp(full_name: _name, email: _email, password: _password);
  //   Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  // }
}
