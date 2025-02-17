import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:qaf_store/features/authentication/screens/login_screen.dart';
=======
import 'package:qaf_store/features/onboarding/screens/onboarding_screen.dart';
>>>>>>> onboarding
import 'package:qaf_store/utils/routing/routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
<<<<<<< HEAD
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
=======
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
>>>>>>> onboarding

      default:
        return null;
    }
  }
}
