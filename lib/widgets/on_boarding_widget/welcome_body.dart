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
          children: <Widget>[
            SizedBox(height: size.height * 0.04),
            const Text(
              "Hi There!",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "Cream",
                fontSize: 60,
              ),
            ),
            SizedBox(height: size.height * 0.08),
            Image.asset(
              "assets/images/chat.png",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.08),
            RoundedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
              },
              backgroundColor: Theme.of(context).primaryColor,
              text: 'LOGIN',
              textColor: Colors.white,
            ),
            SizedBox(height: size.height * 0.02),
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
