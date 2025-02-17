import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QafAppbarTheme {
  QafAppbarTheme._();

  /// Customizable Light App Bar Theme
  
  static final lightAppbarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 24.sp),
    actionsIconTheme: IconThemeData(color: Colors.black, size: 24.sp),
    titleTextStyle: TextStyle(
        fontSize: 18.sp, color: Colors.black, fontWeight: FontWeight.w600),
  );

  /// Customizable Light App Bar Theme
  
  static final AppBarTheme darkAppbarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 24.sp),
    actionsIconTheme: IconThemeData(color: Colors.white, size: 24.sp),
    titleTextStyle: TextStyle(
        fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.w600),
  );
}
