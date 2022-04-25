import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/widgets/sign_up_widget/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/sign_in_screen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpBody(),
    );
  }
}
