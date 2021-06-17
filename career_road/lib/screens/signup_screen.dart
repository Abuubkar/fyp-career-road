import 'package:career_road/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:career_road/components/signupForm.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: 19, vertical: size.height / 20),
            child: SignupForm(),
          ),
        ),
      ),
    );
  }
}


  // void _registerAccount() async {
  //   final User user = (await _auth.createUserWithEmailAndPassword(
  //     email: _emailController.text,
  //     password: _passwordController.text,
  //   ))
  //       .user;

  //   if (user != null) {
  //     if (!user.emailVerified) {
  //       await user.sendEmailVerification();
  //     }
  //     await user.updateProfile(displayName: _displayName.text);
  //     final user1 = _auth.currentUser;
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //         builder: (context) => MainPage(
  //               user: user1,
  //             )));
  //   } else {
  //     _isSuccess = false;
  //   }
  // }
// }
