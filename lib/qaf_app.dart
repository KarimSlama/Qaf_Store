import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/routing/app_router.dart';
import 'package:qaf_store/utils/routing/routes.dart';
import 'package:qaf_store/utils/theme/theme.dart';

class QafApp extends StatelessWidget {
  final AppRouter appRouter;
  const QafApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: QafStrings.appTitle,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.loginScreen,
        onGenerateRoute: appRouter.generateRoute,
        theme: QafTheme.lightTheme,
        darkTheme: QafTheme.darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
