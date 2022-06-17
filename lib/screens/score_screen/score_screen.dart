import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../controllers/question_controller.dart';

class ScoreScreen extends StatelessWidget {
  static const routeName = '/score_screen';
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            'assets/images/quiz_background.svg',
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                'Score',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: kSecondaryColor,
                ),
              ),
              Text(
                "${_qnController.correctAnswer*10}/${_qnController.questions.length * 10}",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: kSecondaryColor),
              ),
              Spacer(flex: 3),
              Row(
                children: [
                  Spacer(),
                  IconButton(onPressed: () {
                    Navigator.pushNamed(context, "/quiz_catalog_screen");
                  }, icon: const Icon(Icons.home_filled), color: Colors.white54,),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
