import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/forgot_password/controller/cubit/reset_password_cubit.dart';
import 'package:qaf_store/features/screens/forgot_password/forgot_password_screen.dart';
import 'package:qaf_store/features/screens/login/controller/cubit/login_cubit.dart';
import 'package:qaf_store/features/screens/login/login_screen.dart';
import 'package:qaf_store/features/screens/onboarding/controller/cubit/onboarding_cubit.dart';
import 'package:qaf_store/features/screens/onboarding/onboarding_screen.dart';
import 'package:qaf_store/features/screens/reset_password/reset_password_screen.dart';
import 'package:qaf_store/features/screens/sign_up/controller/cubit/sign_up_cubit.dart';
import 'package:qaf_store/features/screens/sign_up/sign_up_screen.dart';
import 'package:qaf_store/features/screens/verfiy_email/controller/cubit/verify_email_cubit.dart';
import 'package:qaf_store/features/screens/verfiy_email/verfiy_email_screen.dart';
import 'package:qaf_store/features/screens/navigation_menu/cubit/navigation_cubit.dart';
import 'package:qaf_store/navigation_menu.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<OnboardingCubit>(),
            child: OnboardingScreen(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: SignUpScreen(),
          ),
        );

      case Routes.verifyScreen:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VerifyEmailCubit>(),
            child: VerifyEmailScreen(email: email),
          ),
        );

      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ResetPasswordCubit>(),
            child: ForgotPasswordScreen(),
          ),
        );

      case Routes.resetPasswordScreen:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ResetPasswordScreen(email: email),
        );

      case Routes.navigationMenu:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<NavigationCubit>(),
            child: NavigationMenu(),
          ),
        );
      default:
        return null;
    }
  }
}
