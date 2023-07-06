import 'package:flutter/material.dart';

const Map<int, Color> mapData = <int, Color>{
  50: Color(0xFF43ADE2),
  100: Color(0xFF43ADE2),
  200: Color(0xFF43ADE2),
  300: Color(0xFF43ADE2),
  400: Color(0xFF43ADE2),
  500: Color(0xFF43ADE2),
  600: Color(0xFF43ADE2),
  700: Color(0xFF43ADE2),
  800: Color(0xFF43ADE2),
  900: Color(0xFF43ADE2),
};

///
const Color primaryColor = Color(0xFF43ADE2);
const MaterialColor primarySwatch = MaterialColor(0xFF43ADE2, mapData);

///
Color iconColor = Colors.grey.shade400;
Color borderColor = Colors.grey.shade300;
Color hintColor = Colors.black45;

///
Color errorColor = Colors.red;
Color successColor = Colors.green;

/// TextFormField color
Color textFormFieldColor = primaryColor.withOpacity(.2);
Color textFormBorderColor = primaryColor.withOpacity(.1);
