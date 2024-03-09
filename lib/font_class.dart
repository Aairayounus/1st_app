import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  static TextStyle headlineStyle() {
    return GoogleFonts.roboto(
      fontSize: 40,
      fontWeight: FontWeight.w900,
      color: Colors.black,
    );
  }

  static TextStyle subtitleStyle() {
    return GoogleFonts.roboto(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.grey.shade500,
    );
  }

  static TextStyle textFormStyle() {
    return GoogleFonts.roboto(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      color: Colors.grey.shade600,
    );
  }

  static TextStyle buttonStyle() {
    return GoogleFonts.roboto(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.grey.shade700,
    );
  }

  static TextStyle textStyle() {
    return GoogleFonts.roboto(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  static TextStyle taskStyle() {
    return GoogleFonts.roboto(
      fontSize: 30,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    );
  }
}
