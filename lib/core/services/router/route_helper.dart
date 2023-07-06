import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:user_auth/core/src/index/index.dart';
import 'package:user_auth/core/src/login/login.dart';
import 'package:user_auth/core/src/splash/splash.dart';

import 'route_name.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPath:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const SplashScreen(),
        );
      case loginPath:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const LoginScreen(),
        );
      case indexPath:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const IndexScreen(),
        );

      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return PageTransition(
      type: PageTransitionType.rightToLeft,
      child: Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('ERROR ROUTE')),
      ),
    );
  }
}
