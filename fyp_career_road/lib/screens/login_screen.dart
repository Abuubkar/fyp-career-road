import 'package:fyp_career_road/models/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_career_road/components/loginForm.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:career_road/components/customTextFields.dart';
// // import 'package:career_road/components/signupForm.dart';
// import 'package:career_road/utilities/constants.dart';
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _State createState() => _State();
// }
//
// class _State extends State<LoginScreen> {
//   // bool _rememberMe = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF42A4F0),
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.symmetric(
//             horizontal: 30.0,
//             vertical: 35.0,
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // TITLE TEXT
//
//                 Text('Sign In', style: kTitleStyle),
//                 SizedBox(height: 30.0),
//
//                 // INPUT BOX
//
//                 // EMAIL
//                 CustomTextField(
//                   lableText: 'Email',
//                   textInputType: TextInputType.emailAddress,
//                   icons: Icons.mail_outline,
//                   hint: 'Enter your Email',
//                 ),
//                 // PASSWORD
//                 CustomTextField(
//                   lableText: 'Password',
//                   textInputType: TextInputType.visiblePassword,
//                   icons: Icons.lock,
//                   hint: 'Enter your Password',
//                   hide: true,
//                 ),
//
//                 SizedBox(
//                   height: 10,
//                 ),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     // CHECK BOX
//                     Row(
//                       children: [
//                         // Check Box
//                         // Theme(
//                         //   data: ThemeData(unselectedWidgetColor: Colors.white),
//                         //   child: Checkbox(
//                         //     value: _rememberMe,
//                         //     checkColor: Colors.blueAccent,
//                         //     activeColor: Colors.white,
//                         //     onChanged: (value) {
//                         //       setState(() {
//                         //         _rememberMe = value;
//                         //       });
//                         //     },
//                         //   ),
//                         // ),
//
//                         // REMEMBER ME
//                         //   Text(
//                         //     'Remember me',
//                         //     style: kLabelStyle,
//                         //   ),
//                       ],
//                     ),
//
//                     // FORGOT BUTTON
//                     GestureDetector(
//                       onTap: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (context) => LoginScreen(),
//                         //   ),
//                         // );
//                       },
//                       child: Center(
//                         child: Text(
//                           'Forgot Password?',
//                           style: TextStyle(
//                               color: Colors.white, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//
//                 // LOGIN BUTTON
//
//                 GestureDetector(
//                   onTap: () {},
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(25.0),
//                     ),
//                     child: Center(
//                       child: Text(
//                         'Login',
//                         style: TextStyle(
//                             color: Color(0xFF42A4F0),
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     margin: EdgeInsets.only(top: 20.0, left: 15, right: 15),
//                     width: double.infinity,
//                     height: 50,
//                   ),
//                 ),
//                 SizedBox(height: 30.0),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
