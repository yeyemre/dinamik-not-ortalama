import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const String appTitle = "Dinamik Not Hesaplama";
  static const String appBarTitle = "Ortalama Hesapla";
  static final TextStyle titleStyle =
      textStyle(24, FontWeight.w900, themeData.primaryColor);

  static ThemeData themeData = ThemeData(
    primarySwatch: const MaterialColor(
      0xFFb37d55,
      <int, Color>{
        50: Color(0xFFb98862), //10%
        100: Color(0xFFbf9270), //20%
        200: Color(0xFFc59c7e), //30%
        300: Color(0xFFcba78b), //40%
        400: Color(0xFFd1b199), //50%
        500: Color(0xFFd7bba6), //60%
        600: Color(0xFFddc6b4), //70%
        700: Color(0xFFe3d0c1), //80%
        800: Color(0xFFe9dacf), //90%
        900: Color(0xFFf0e5dc), //100%
      },
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static TextStyle textStyle(double size, FontWeight fontWeight, Color color) =>
      GoogleFonts.quicksand(
          fontWeight: fontWeight, fontSize: size, color: color);
}
