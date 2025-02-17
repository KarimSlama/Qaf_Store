import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_screenutil/flutter_screenutil.dart';
=======
>>>>>>> onboarding

class QafOutlinedButtonTheme {
  QafOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: BorderSide(color: Colors.blue),
      textStyle: TextStyle(
<<<<<<< HEAD
          fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.w600),
=======
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
>>>>>>> onboarding
      padding: EdgeInsetsDirectional.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(14)),
    ),
  );

  static OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      side: BorderSide(color: Colors.blue),
      textStyle: TextStyle(
<<<<<<< HEAD
          fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w600),
=======
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
>>>>>>> onboarding
      padding: EdgeInsetsDirectional.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(14)),
    ),
  );
}
