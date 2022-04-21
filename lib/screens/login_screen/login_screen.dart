import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/widgets/login_widget/login_body.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBody(),
    );
  }
}
