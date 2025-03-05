import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/network/repositories/network_repository.dart';
import 'package:qaf_store/network/services/network_controller/network_cubit.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/constants/shared_preference_keys.dart';
import 'package:qaf_store/utils/routings/app_router.dart';
import 'package:qaf_store/utils/routings/routes.dart';
import 'package:qaf_store/utils/theme/theme.dart';

class QafApp extends StatelessWidget {
  final AppRouter? appRouter;
  const QafApp({super.key, this.appRouter});

  @override
  Widget build(BuildContext context) {
    print('is logged user is ${isLoggedUser}');
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: RepositoryProvider(
        create: (context) => NetworkRepository(),
        child: BlocProvider(
          create: (context) => NetworkCubit(
              context: context,
              networkRepository:
                  RepositoryProvider.of<NetworkRepository>(context)),
          child: MaterialApp(
            title: QafStrings.appTitle,
            debugShowCheckedModeBanner: false,
            initialRoute: isLoggedUser
                ? FirebaseAuth.instance.currentUser!.emailVerified
                    ? Routes.navigationMenu
                    : Routes.verifyScreen
                : Routes.onboardingScreen,
            onGenerateRoute: appRouter?.generateRoute,
            theme: QafTheme.lightTheme,
            darkTheme: QafTheme.darkTheme,
            themeMode: ThemeMode.system,
          ),
        ),
      ),
    );
  }
}
