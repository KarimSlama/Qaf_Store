import 'package:flutter/material.dart';

class QafColors {
  QafColors._();

  /// Qaf Basic Colors
  static const Color primary = Color(0xff4b68ff);
  static const Color secendary = Color(0xffFFE248);
  static const Color accent = Color(0xffb0c7ff);

  /// Texts Colors
  static const Color textPrimary = Color(0xff333333);
  static const Color textSecendary = Color(0xff6c7570);
  static const Color textWhite = Colors.white;

  /// Linear Gradient Colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0, 0),
    end: Alignment(.707, -.707),
    colors: [
      Color(0xffff9a9e),
      Color(0xfffad0c4),
      Color(0xfffad0c4),
    ],
  );

  /// Background Colors
  static const Color light = Color(0xfff6f6f6);
  static const Color dark = Color(0xff272727);
  static const Color primaryBackground = Color(0xfff3f5ff);

  /// Background Container Colors
  static const Color lightContainer = light;
  static Color darkContainer = QafColors.white.withValues(alpha: .1);

  /// Buttons Colors
  static const Color buttonPrimary = Color(0xff4b68ff);
  static const Color buttonSecendary = Color(0xff6c7570);
  static const Color buttonDisabled = Color(0xffc4c4c4);

  /// Border Colors
  static const Color borderPrimary = Color(0xffd9d9d9);
  static const Color borderSecendary = Color(0xffe6e6e6);

  /// Error and Validation Colors
  static const Color error = Color(0xffd32f2f);
  static const Color success = Color(0xff388e3c);
  static const Color warning = Color(0xfff57c00);
  static const Color info = Color(0xff1976d2);

  /// Natural Shades
  static const Color black = Color(0xff232323);
  static const Color darkerGrey = Color(0xff4f4f4f);
  static const Color darkGrey = Color(0xff939393);
  static const Color grey = Color(0xffe0e0e0);
  static const Color softGrey = Color(0xfff4f4f4);
  static const Color lightGrey = Color(0xfff9f9f9);
  static const Color white = Color(0xffffffff);
}
