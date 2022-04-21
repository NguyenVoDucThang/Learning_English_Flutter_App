import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/widgets/login_widget/already_have_account.dart';
import 'package:learning_english_flutter_app/widgets/login_widget/rounded_input_field.dart';
import 'package:learning_english_flutter_app/widgets/login_widget/rounded_password_field.dart';
import 'package:learning_english_flutter_app/widgets/on_boarding_widget/rounded_button.dart';
import 'package:learning_english_flutter_app/widgets/sign_up_widget/sign_up_back_ground.dart';
import 'package:learning_english_flutter_app/widgets/sign_up_widget/social_icon.dart';

import 'or_divider.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignUpBackGround(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/signup.png',
            height: size.height * 0.25,
          ),
          RoundedInputField(
            onChanged: (value) {},
            hintText: 'Your email',
            icon: Icons.person,
          ),
          RoundedInputField(
            onChanged: (value) {},
            hintText: 'Your Name',
            icon: Icons.drive_file_rename_outline,
          ),
          RoundedPasswordField(
            hintText: 'Password',
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            hintText: 'Confirm Password',
            onChanged: (value) {},
          ),
          const SizedBox (height: 10),
          RoundedButton(
            text: 'SIGN UP',
            backgroundColor: const Color(0xFF6F35A5),
            onPressed: () {},
            textColor: Colors.white,
          ),
          const SizedBox(height: 10),
          const AlreadyHaveAnAccount(login: false,),
          const OrDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIcon(
                onPress: () {},
                imagePath: 'assets/images/facebook.png',
              ),
              SocialIcon(
                onPress: () {},
                imagePath: 'assets/images/google.png',
              )
            ],
          )
        ],
      ),
    );
  }
}
