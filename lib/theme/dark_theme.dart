import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: HexColor('#ffffff'))),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        color: HexColor('#ffffff'),
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: GoogleFonts.poppins(
        color: HexColor('#ffffff'),
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: GoogleFonts.poppins(
        color: HexColor('#ffffff'),
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: HexColor('#ffffff'),
        fontSize: 27,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: HexColor('#ffffff'),
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.poppins(
        color: HexColor('#ffffff'),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: GoogleFonts.poppins(
        color: HexColor('#ffffff'),
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: GoogleFonts.poppins(
        color: HexColor('#ffffff'),
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: GoogleFonts.poppins(
        color: HexColor('#ffffff'),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      displayLarge: GoogleFonts.poppins(
        color: HexColor('#ffffff'),
        fontSize: 50,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: GoogleFonts.poppins(
        color: HexColor('#ffffff'),
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: GoogleFonts.poppins(
        color: HexColor('#ffffff'),
        fontSize: 12,
        fontWeight: FontWeight.w300,
      ),
    ),
    colorScheme: ColorScheme.dark(
        background: HexColor('#2e2e2e'), //GRIS BONITO DE FONDO
        primary: HexColor('#4181FF'), //AZUL DE FONDO
        secondary: HexColor("#FFFFFF"), //BLANCO
        tertiary: HexColor('#75767b')));//GRIS DEL MODERNCATEGORY
