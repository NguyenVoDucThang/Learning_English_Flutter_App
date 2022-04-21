import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/screens/login_screen/login_screen.dart';
import 'package:learning_english_flutter_app/screens/login_screen/sign_up_screen.dart';
import 'package:learning_english_flutter_app/screens/on_boarding_screen/welcome_screen.dart';

import 'screens/on_boarding_screen/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primaryColor: const Color.fromRGBO(102, 103, 171, 1),
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'OpenSans'),
        ),
      ),
      initialRoute: '/',
      routes: {
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OnBoardingScreen();
  }
}

