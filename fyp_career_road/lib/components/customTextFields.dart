import 'package:flutter/material.dart';
import 'package:fyp_career_road/models/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {@required this.lableText,
      @required this.textInputType,
      @required this.icons,
      @required this.hint,
      this.hide = false,
      @required this.controller});

  final String lableText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final IconData icons;
  final String hint;
  final bool hide;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(this.lableText, style: kLabelStyle),
        SizedBox(height: 7.0),
        Container(
          height: 50,
          // margin: EdgeInsets.only(left: 10, right: 10),
          decoration: kBoxDecorationStyle,
          child: TextField(
            obscureText: this.hide,
            keyboardType: this.textInputType,
            style: kLabelStyle,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 15.0),
              border: InputBorder.none,
              prefixIcon: Icon(
                this.icons,
                color: Colors.white,
              ),
              hintText: this.hint,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
        SizedBox(height: 7.0),
      ],
    );
  }
}
