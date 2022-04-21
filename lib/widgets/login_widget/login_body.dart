import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/widgets/login_widget/rounded_input_field.dart';
import 'package:learning_english_flutter_app/widgets/login_widget/rounded_password_field.dart';
import 'package:learning_english_flutter_app/widgets/on_boarding_widget/rounded_button.dart';

import 'already_have_account.dart';
import 'custom_icon_text_field.dart';
import 'login_back_ground.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: LoginBackGround(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/login.png',
              height: size.height * 0.3,
            ),
            RoundedInputField(
              icon: Icons.person,
              hintText: 'Your email',
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: 'Password',
              onChanged: (value) {},
            ),
            const SizedBox(height: 5),
            RoundedButton(
              textColor: Colors.white,
              text: 'LOGIN',
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            const AlreadyHaveAnAccount(login: true),
          ],
        ),
      ),
    );
  }
}
