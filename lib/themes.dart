import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// # Colors

// ## Primary
Color brightBlue = const Color.fromRGBO(58, 123, 253, 1);
Color gradientStart = const Color.fromRGBO(87, 221, 255, 1);
Color gradientEnd = const Color.fromRGBO(192, 88, 243, 1);
// ### Neutral
Color white = const Color.fromRGBO(255, 255, 255, 1);
// ### Light theme
Color veryLightGray = const Color.fromRGBO(250, 250, 250, 1);
Color veryLightGrayishBlue = const Color.fromRGBO(228, 229, 241, 1);
Color lightGrayishBlueLight = const Color.fromRGBO(210, 211, 219, 1);
Color darkGrayishBlueLight = const Color.fromRGBO(147, 148, 165, 1);
Color veryDarkGrayishBlueLight = const Color.fromRGBO(72, 75, 106, 1);
Color lightGrayishBlue = const Color.fromRGBO(194, 195, 214, 0.5);
// ### Dark theme
Color veryDarkBlue = const Color.fromRGBO(22, 23, 34, 1);
Color veryDarkDesaturatedBlue = const Color.fromRGBO(37, 39, 60, 1);
Color lightGrayishBlueDark = const Color.fromRGBO(202, 205, 232, 1);
Color lightGrayishBlueActive = const Color.fromRGBO(228, 229, 241, 1);
Color darkGrayishBlueDark = const Color.fromRGBO(119, 122, 146, 1);
Color veryDarkGrayishBlueDark = const Color.fromRGBO(77, 80, 102, 1);
Color veryDarkGrayishBlue = const Color.fromRGBO(57, 58, 76, 1);
Color darkGrayishBlue = const Color.fromRGBO(77, 80, 103, 1);
Color lightGrayisBlue = const Color.fromRGBO(91, 94, 126, 1);
Color lightBlack = const Color.fromRGBO(0, 0, 0, 0.5);

// # Themes

// ## Text
TextTheme textTheme = TextTheme(
  labelSmall: GoogleFonts.josefinSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.17,
  ),
  bodySmall: GoogleFonts.josefinSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.19,
  ),
  bodyMedium: GoogleFonts.josefinSans(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.19,
  ),
);

// ## Color

// ### Light
ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    surface: veryLightGrayishBlue,
    onSurface: white,
    primary: white,
    onPrimary: veryDarkGrayishBlueLight,
    secondary: white,
    onSecondary: darkGrayishBlueLight,
    onSecondaryFixed: brightBlue,
    tertiary: white,
    onTertiary: lightGrayishBlueLight,
    error: Colors.red,
    onError: Colors.white,
    primaryContainer: gradientStart,
    secondaryContainer: gradientEnd,
    tertiaryFixed: veryDarkGrayishBlueLight,
    shadow: lightGrayishBlue,
  ),
  textTheme: textTheme,
);

// ### Dark
ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    surface: veryDarkBlue,
    onSurface: veryDarkDesaturatedBlue,
    primary: veryDarkDesaturatedBlue,
    onPrimary: lightGrayishBlueDark,
    secondary: veryDarkDesaturatedBlue,
    onSecondary: lightGrayisBlue,
    onSecondaryFixed: brightBlue,
    tertiary: veryDarkDesaturatedBlue,
    onTertiary: darkGrayishBlue,
    error: Colors.red,
    onError: Colors.white,
    primaryContainer: gradientStart,
    secondaryContainer: gradientEnd,
    tertiaryFixed: veryDarkGrayishBlue,
    shadow: lightBlack,
  ),
  textTheme: textTheme,
);
