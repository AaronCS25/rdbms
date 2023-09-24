import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headlineSmall: GoogleFonts.montserrat(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: GoogleFonts.montserrat(
            fontSize: 52,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: GoogleFonts.montserrat(
            fontSize: 64,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          bodyLarge: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
          labelSmall: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: const Color.fromRGBO(247, 253, 250, 1.0),
          ),
          labelMedium: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: const Color.fromRGBO(247, 253, 250, 1.0),
          ),
          labelLarge: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: const Color.fromRGBO(247, 253, 250, 1.0),
          ),
        ),
      );
}
