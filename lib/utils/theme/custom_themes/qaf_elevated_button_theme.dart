import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_screenutil/flutter_screenutil.dart';
=======
>>>>>>> onboarding

class QafElevatedButtonTheme {
  QafElevatedButtonTheme._();

  /// Customizable Light Elevated Button
<<<<<<< HEAD
  
  static final ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      
=======

  static final ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
>>>>>>> onboarding
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
<<<<<<< HEAD
      side: const BorderSide(color: Colors.blue),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(
          fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white),
=======
      // side: const BorderSide(color: Colors.blue),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
>>>>>>> onboarding
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(12)),
    ),
  );

  /// Customizable Dark Elevated Button
<<<<<<< HEAD
  
=======

>>>>>>> onboarding
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
<<<<<<< HEAD
      side: const BorderSide(color: Colors.blue),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(
          fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white),
=======
      // side: const BorderSide(color: Colors.blue),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
>>>>>>> onboarding
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(12)),
    ),
  );
}
