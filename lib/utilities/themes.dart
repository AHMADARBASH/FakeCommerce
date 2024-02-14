import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color _primaryColor = Color(0xff9675fa);
const Color _secondaryColor = Colors.white;
Color _WhiteCanvasColor = Colors.grey[100]!;
Color _DarkCanvasColor = Colors.black;

Map<String, dynamic> themes = {
  'whiteTheme': ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: _WhiteCanvasColor,
    canvasColor: _WhiteCanvasColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: _primaryColor,
        secondary: _secondaryColor,
        tertiary: Colors.white),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.exo2().copyWith(
        color: _primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      bodyMedium:
          GoogleFonts.exo2().copyWith(color: _primaryColor, fontSize: 18),
      bodySmall: GoogleFonts.exo2().copyWith(color: _primaryColor),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: _WhiteCanvasColor,
        surfaceTintColor: Colors.transparent),
    drawerTheme: DrawerThemeData(
      backgroundColor: _WhiteCanvasColor,
      elevation: 0,
    ),
    iconTheme: IconThemeData(
      color: _primaryColor,
    ),
    primaryIconTheme: IconThemeData(
      color: _primaryColor,
    ),
    iconButtonTheme: IconButtonThemeData(
        style: ElevatedButton.styleFrom(foregroundColor: _primaryColor)),
    bottomAppBarTheme: const BottomAppBarTheme(color: _primaryColor),
  ),
  'darkTheme': ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: _DarkCanvasColor,
    canvasColor: _DarkCanvasColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: _primaryColor,
      secondary: _secondaryColor,
      tertiary: Colors.black,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.exo2().copyWith(
        color: _primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      bodyMedium:
          GoogleFonts.exo2().copyWith(color: _primaryColor, fontSize: 18),
      bodySmall: GoogleFonts.exo2().copyWith(color: _primaryColor),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: _DarkCanvasColor,
        surfaceTintColor: Colors.transparent),
    drawerTheme: DrawerThemeData(
      backgroundColor: _DarkCanvasColor,
      elevation: 0,
    ),
    iconTheme: IconThemeData(
      color: _primaryColor,
    ),
    primaryIconTheme: IconThemeData(
      color: _primaryColor,
    ),
    iconButtonTheme: IconButtonThemeData(
        style: ElevatedButton.styleFrom(foregroundColor: _primaryColor)),
    bottomAppBarTheme: const BottomAppBarTheme(color: _primaryColor),
  ),
};
