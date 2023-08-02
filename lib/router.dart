import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/features/auth/screens/auth_screen.dart';

Route<dynamic> genrateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routename:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(child: Text("Error 404")),
        ),
      );
  }
}
