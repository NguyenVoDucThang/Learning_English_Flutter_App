import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learning_english_flutter_app/screens/quiz_catalog_screen.dart';

import '../../controllers/question_controller.dart';
import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  static const String routeName = '/quiz_screen';
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());

    Future<bool> _onBackPressed() {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const QuizCatalogScreen(),
        ),
      );
      return Future.value(true);
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18.0),
              child: GestureDetector(
                onTap: _controller.nextQuestion,
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Body(),
      ),
    );
  }
}
