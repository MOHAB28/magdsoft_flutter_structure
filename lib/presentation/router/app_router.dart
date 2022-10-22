import 'package:flutter/cupertino.dart';

import '../screens/shared/home_screen.dart';
import '../screens/shared/splash_screen.dart';
import '../screens/user/login_screen.dart';

class Routes {
  static const String splashScreenKey = '/';
  static const String loginScreenKey = '/login';
  static const String confirmCodeScreenKey = '/comfirm_code';
  static const String homeScreenKey = '/home';
}

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreenKey:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginScreenKey:
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case Routes.homeScreenKey:
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}