import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color _primaryColor = Color(0xff9675fa);
const Color _secondaryColor = Colors.white;
Color _canvasColor = Colors.grey[100]!;

Map<String, dynamic> themes = {
  'whiteTheme': ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: _canvasColor,
    canvasColor: _canvasColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: _primaryColor,
      secondary: _secondaryColor,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.exo2().copyWith(
        color: _primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      bodyMedium: GoogleFonts.exo2().copyWith(color: _primaryColor),
      bodySmall: GoogleFonts.exo2().copyWith(color: _primaryColor),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _canvasColor,
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: _canvasColor,
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
