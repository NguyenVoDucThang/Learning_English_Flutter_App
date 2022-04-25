import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/screens/login_screen.dart';
import 'package:learning_english_flutter_app/screens/sign_up_screen.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final bool login;

  const AlreadyHaveAnAccount({
    Key? key,
    required this.login,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? 'Don\'t have an account ? ' : 'Already have an account ? ',
          style: const TextStyle(
            color: Color(0xFF6F35A5),
          ),
        ),
        GestureDetector(
          onTap: () {
            login
                ? Navigator.of(context).pushNamed(SignUpScreen.routeName)
                : Navigator.of(context).pushNamed(LoginScreen.routeName);
          },
          child: Text(
            login ? ' Sign Up' : ' Login',
            style: const TextStyle(
              color: Color(0xFF6F35A5),
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
