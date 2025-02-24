import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:qaf_store/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/theme/theme.dart';

class QafApp extends StatelessWidget {
  const QafApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: GetMaterialApp(
        title: QafStrings.appTitle,
        debugShowCheckedModeBanner: false,
        home: OnboardingScreen(),
        theme: QafTheme.lightTheme, 
        darkTheme: QafTheme.darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
