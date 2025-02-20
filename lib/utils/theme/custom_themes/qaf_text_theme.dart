import 'package:flutter/material.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';

/// Custom Class for Light & Dark Text Themes
class QafTextTheme {
  QafTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lighTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32, fontWeight: FontWeight.bold, color: QafColors.dark),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24, fontWeight: FontWeight.w600, color: QafColors.dark),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18, fontWeight: FontWeight.w600, color: QafColors.dark),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w600, color: QafColors.dark),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w500, color: QafColors.dark),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w400, color: QafColors.dark),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w500, color: QafColors.dark),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 12, fontWeight: FontWeight.normal, color: QafColors.dark),
    bodySmall: const TextStyle().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: QafColors.dark.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12, fontWeight: FontWeight.normal, color: QafColors.dark),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: QafColors.dark.withOpacity(0.5)),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32, fontWeight: FontWeight.bold, color: QafColors.light),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24, fontWeight: FontWeight.w600, color: QafColors.light),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18, fontWeight: FontWeight.w600, color: QafColors.light),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w600, color: QafColors.light),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w500, color: QafColors.light),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w400, color: QafColors.light),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w500, color: QafColors.light),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 12, fontWeight: FontWeight.normal, color: QafColors.light),
    bodySmall: const TextStyle().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: QafColors.light.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12, fontWeight: FontWeight.normal, color: QafColors.light),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: QafColors.light.withOpacity(0.5)),
  );
}
