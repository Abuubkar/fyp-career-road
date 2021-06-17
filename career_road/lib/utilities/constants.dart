import 'package:flutter/material.dart';

final kTitleStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 25,
);

Color kBackgroundColor = Color(0xFF42A4F0);

BoxDecoration kBoxDecoration = BoxDecoration(
  border: Border.all(color: Colors.black),
  borderRadius: BorderRadius.circular(29.0),
);
OutlineInputBorder kOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black),
  borderRadius: BorderRadius.circular(29.0),
);

// OutlineInputBorder kOutlineErrorBorder = OutlineInputBorder(
//   borderSide: BorderSide(color: Colors.red),
//   borderRadius: BorderRadius.circular(29.0),
//);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 12,
);
final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
    ),
  ],
);

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontSize: 12,
);
