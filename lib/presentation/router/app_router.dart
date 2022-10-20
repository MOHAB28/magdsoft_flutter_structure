import 'package:flutter/cupertino.dart';

import '../screens/shared/splash_screen.dart';
import '../screens/user/confirm_code_screen.dart';
import '../screens/user/login_screen.dart';

class Routes {
  static const String splashScreenKey = '/';
  static const String loginScreenKey = '/login';
  static const String confirmCodeScreenKey = '/comfirm_code';
}

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreenKey:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginScreenKey:
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case Routes.confirmCodeScreenKey:
        return CupertinoPageRoute(builder: (_) => const ConfirmCodeScreen());
      default:
        return null;
    }
  }
}