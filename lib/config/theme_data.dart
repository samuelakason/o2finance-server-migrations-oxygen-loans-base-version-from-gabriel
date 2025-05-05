// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AppThemes {
  static final appThemeData = ThemeData(
    primaryColor: Color(0xFF1AB6DC),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.montserrat(
          textStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold)),
      bodyMedium: GoogleFonts.montserrat(
          textStyle: const TextStyle(color: Colors.black)),
    ),
  );
}
