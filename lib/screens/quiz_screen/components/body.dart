import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:learning_english_flutter_app/screens/quiz_screen/components/progress_bar.dart';
import 'package:learning_english_flutter_app/screens/quiz_screen/components/question_card.dart';

import '../../../constants/constants.dart';
import '../../../controllers/question_controller.dart';



class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: SvgPicture.asset(
            'assets/images/quiz_background.svg',
            fit: BoxFit.fill,
          ),
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ProgressBar(),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text: "Question ${_questionController.questionNumber.value}",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: kSecondaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: '/${_questionController.questions.length}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: kSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(thickness: 1, color: kSecondaryColor),
              SizedBox(height: 8),
              //QuestionCard(),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQuestionNumber,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    question: _questionController.questions[index],
                  ),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}
