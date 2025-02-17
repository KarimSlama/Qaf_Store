import 'package:flutter/material.dart';
import 'package:qaf_store/features/authentication/screens/login_screen.dart';
import 'package:qaf_store/utils/routing/routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      default:
        return null;
    }
  }
}
