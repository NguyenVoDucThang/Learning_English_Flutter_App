import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/widgets/on_boarding_widget/welcome_body.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeBody(),
    );
  }
}
