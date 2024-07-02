import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



final ThemeData appTheme = ThemeData(
  primaryColor: ThemeManager.primaryColor,
  hintColor: ThemeManager.secondaryColor,
  scaffoldBackgroundColor: ThemeManager.backgroundColor,
  appBarTheme:  AppBarTheme(
    backgroundColor: ThemeManager.primaryColor,
  ),
  buttonTheme:  ButtonThemeData(
    buttonColor: ThemeManager.secondaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ThemeManager.secondaryColor,
    ),
  ),
  textTheme: GoogleFonts.nunitoTextTheme(),
);

class ThemeManager{
  static Color  primaryColor =const Color(0xFF60A898);
  static Color secondaryColor = const Color(0xCDFEB5B8);
  static Color thirdColor = const Color(0xCDe0c3f6);

  static Color backgroundColor = Colors.white;
}
Color getRandomColors() {
  final List<Color> colors = [
    ThemeManager.primaryColor,
    ThemeManager.secondaryColor,
    ThemeManager.thirdColor
  ];
  colors.shuffle();
  return colors.first;
}
