import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color primary = Color(0xFF3A59D1);
  static const Color primaryDark = Color(0xFF1E3A8A);
  static const Color accent = Color(0xFF5AC8FA);
  static const Color background = Color(0xFFF6F7FB);
  static const Color surface = Colors.white;
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF8A8FA3);
  static const Color error = Color(0xFFE63946);
  static const Color border = Color(0xFFE3E5EC);
  static const LinearGradient headerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryDark],
  );
}
