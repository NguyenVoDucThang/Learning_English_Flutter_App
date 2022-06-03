import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/screens/login_screen.dart';
import 'package:learning_english_flutter_app/screens/sign_up_screen.dart';
import 'package:learning_english_flutter_app/widgets/on_boarding_widget/rounded_button.dart';

import 'background.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "WELCOME TO LET",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/images/chat.png",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
              },
              backgroundColor: Theme.of(context).primaryColor,
              text: 'LOGIN',
              textColor: Colors.white,
            ),
            SizedBox(height: size.height * 0.01),
            RoundedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SignUpScreen.routeName);
              },
              textColor: Theme.of(context).primaryColor,
              text: 'SIGNUP',
              backgroundColor: const Color.fromRGBO(232, 232, 232, 1.0),
            ),
          ],
        ),
      ),
    );
  }
}
