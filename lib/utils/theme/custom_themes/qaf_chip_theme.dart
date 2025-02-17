import 'package:flutter/material.dart';

class QafChipTheme {
  QafChipTheme._();

  static final ChipThemeData lightChipThemeData = ChipThemeData(
    disabledColor: Colors.grey.withValues(alpha: .5),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.blue,
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white
  );


  static final ChipThemeData darkChipThemeData = ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: const TextStyle(color: Colors.white),
    selectedColor: Colors.blue,
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white
  );
}