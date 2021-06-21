import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fyp_career_road/main.dart';
import 'package:fyp_career_road/models/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Widget nextWidget = AuthenticationWrapper();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => nextWidget));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: height,
      color: kBackgroundColor,
      child: Center(
        child: SpinKitRipple(
          color: Colors.white,
          size: 80.0,
          borderWidth: 3.0,
        ),
      ),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Expanded(child: SizedBox(height: 5)),
      //     SizedBox(height: 60.0),
      //     Image.asset('images/kCareerRoadLogo.png', width: 2 * width / 5),
      //     Expanded(child: SizedBox(height: 5)),
      //     SpinKitRipple(
      //       color: AppColors.white,
      //       size: 60.0,
      //       borderWidth: 3.0,
      //     ),
      //     SizedBox(height: 60.0),
      //   ],
      // ),
    );
  }
}
