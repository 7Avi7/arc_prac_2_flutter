import 'package:flutter/material.dart';

import 'views/profile_view.dart';
import 'views/signin_view.dart';

class RouteNavigation {
  static const String signIn = 'signIn';
  static const String profileView = 'profileView';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signIn:
        return MaterialPageRoute(builder: (context) => const SignInView());

      case profileView:
        return MaterialPageRoute(builder: (context) => const ProfileView());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
