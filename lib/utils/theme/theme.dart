import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qaf_store/utils/theme/custom_themes/qaf_appbar_theme.dart';
import 'package:qaf_store/utils/theme/custom_themes/qaf_bottom_sheet.dart';
import 'package:qaf_store/utils/theme/custom_themes/qaf_check_box_theme.dart';
import 'package:qaf_store/utils/theme/custom_themes/qaf_chip_theme.dart';
import 'package:qaf_store/utils/theme/custom_themes/qaf_elevated_button_theme.dart';
import 'package:qaf_store/utils/theme/custom_themes/qaf_outlined_button_theme.dart';
import 'package:qaf_store/utils/theme/custom_themes/qaf_text_field_theme.dart';
import 'package:qaf_store/utils/theme/custom_themes/qaf_text_theme.dart';

class QafTheme {
  QafTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins.toString(),
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: QafTextTheme.lighTextTheme,
      chipTheme: QafChipTheme.lightChipThemeData,
      appBarTheme: QafAppbarTheme.lightAppbarTheme,
      checkboxTheme: QafCheckBoxTheme.lightCheckBoxTheme,
      bottomSheetTheme: QafBottomSheet.lightBottomSheetTheme,
      outlinedButtonTheme: QafOutlinedButtonTheme.lightOutlinedButtonTheme,
      elevatedButtonTheme: QafElevatedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: QafTextFieldTheme.lightInputDecorationTheme);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins.toString(),
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: QafTextTheme.darkTextTheme,
      chipTheme: QafChipTheme.darkChipThemeData,
      appBarTheme: QafAppbarTheme.darkAppbarTheme,
      checkboxTheme: QafCheckBoxTheme.darkCheckBoxTheme,
      bottomSheetTheme: QafBottomSheet.darkBottomSheetTheme,
      outlinedButtonTheme: QafOutlinedButtonTheme.darkOutlinedButtonTheme,
      elevatedButtonTheme: QafElevatedButtonTheme.darkElevatedButtonTheme,
      inputDecorationTheme: QafTextFieldTheme.darkInputDecorationTheme);
}
