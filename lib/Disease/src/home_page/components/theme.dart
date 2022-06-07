// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xff4e5ae8);
const Color yellowClr = Color(0xffffb746);
const Color pinkClr = Color(0xffff4667);
const Color white = Colors.white;
const Color primaryClr = bluishClr;
const Color darkGreyClr = Color(0xff121212);
const darkHeaderClr = Color(0xff424242);

class Themes {
  static final light = ThemeData(
    backgroundColor: Colors.white,
    primaryColor: primaryClr,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    backgroundColor: darkGreyClr,
    primaryColor: Colors.purpleAccent,
    brightness: Brightness.dark,
  );
}

TextStyle get subHeadinStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ));
}

TextStyle get headinStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  ));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ));
}

TextStyle get subtitleStyle {
  return GoogleFonts.lato(
      color: Colors.black,
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ));
}
