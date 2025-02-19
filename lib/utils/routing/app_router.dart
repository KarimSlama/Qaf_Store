import 'package:flutter/material.dart';
import 'package:qaf_store/features/onboarding/screens/onboarding_screen.dart';
import 'package:qaf_store/utils/routing/routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      default:
        return null;
    }
  }
}
