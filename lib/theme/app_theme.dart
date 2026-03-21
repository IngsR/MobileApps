import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Warna utama
  static const Color primary = Color(0xFF5C35C9);
  static const Color primaryLight = Color(0xFF7C5DE8);
  static const Color primaryDark = Color(0xFF3D1FA8);
  static const Color accent = Color(0xFFFFC107);
  static const Color background = Color(0xFFF4F6FF);
  static const Color surface = Colors.white;
  static const Color textDark = Color(0xFF1A1A2E);
  static const Color textGrey = Color(0xFF8A8AA0);
  static const Color navBackground = Color(0xFF1E1B4B);

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: background,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textDark,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textDark,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textDark,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14,
          color: textGrey,
        ),
        labelSmall: GoogleFonts.poppins(
          fontSize: 11,
          color: textGrey,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: surface,
        foregroundColor: textDark,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textDark,
        ),
      ),
    );
  }
}
