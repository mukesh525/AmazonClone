import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/constants/global_variable.dart';
import 'package:flutter_amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:flutter_amazon_clone/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Amazon Clone',
        theme: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: GlobalVariables.secondaryColor,
            ),
            scaffoldBackgroundColor: GlobalVariables.backgroundColor,
            appBarTheme: const AppBarTheme(
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ))),
        onGenerateRoute: (settings) => genrateRoute(settings),
        home: const AuthScreen());
  }
}
