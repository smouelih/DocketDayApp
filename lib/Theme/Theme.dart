// ignore_for_file: file_names

import 'package:flutter/material.dart';

Color mainColor = const Color(0xFF4e5ae8);
//! Color mainColor = const Color(0xFFFF7B00);

class Themes {
  static final light = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'changa',
    primaryColor: mainColor,
    appBarTheme: AppBarTheme(
      backgroundColor: mainColor,
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'changa',
  );
}
