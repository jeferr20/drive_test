import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lighTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: HexColor('#000000'))),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        color: HexColor('#000000'),
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: GoogleFonts.poppins(
        color: HexColor('#000000'),
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: GoogleFonts.poppins(
        color: HexColor('#000000'),
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: HexColor('#000000'),
        fontSize: 27,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: HexColor('#000000'),
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.poppins(
        color: HexColor('#000000'),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: GoogleFonts.poppins(
        color: HexColor('#000000'),
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: GoogleFonts.poppins(
        color: HexColor('#000000'),
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: GoogleFonts.poppins(
        color: HexColor('#000000'),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      displayLarge: GoogleFonts.poppins(
        color: HexColor('#000000'),
        fontSize: 50,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: GoogleFonts.poppins(
        color: HexColor('#000000'),
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: GoogleFonts.poppins(
        color: HexColor('#000000'),
        fontSize: 12,
        fontWeight: FontWeight.w300,
      ),
    ),
    colorScheme: ColorScheme.light(
        background: HexColor('#ffffff'),
        primary: HexColor('#1C7DFF'),
        secondary: HexColor("#000000"),
        tertiary: HexColor('#ffffff')));
