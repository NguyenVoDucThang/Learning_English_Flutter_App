import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:learning_english_flutter_app/screens/quiz_screen/quiz_screen.dart';

import '../helpers/navigator_helper.dart';
import '../models/question_model.dart';
import '../screens/score_screen/score_screen.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;

  Animation? get animation => this._animation;

  PageController? _pageController;

  PageController? get pageController => this._pageController;

  List<Question> _questions = data
      .map(
        (question) => Question(
          id: question['is'],
          question: question['question'],
          answer: question['answer_index'],
          options: question['options'],
        ),
      )
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;

  bool get isAnswered => this._isAnswered;

  int _correctAnswer = 0;

  int get correctAnswer => this._correctAnswer;

  int _selectedAnswer = 0;

  int get selectedAnswer => this._selectedAnswer;

  RxInt _questionNumber = 1.obs;

  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAnswers = 0;

  int get numOfCorrectAnswers => this._numOfCorrectAnswers;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController!)
      ..addListener(() {
        update();
      });

    _animationController!.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    _animationController!.dispose();
    _pageController!.dispose();
    super.onClose();
  }

  void checkAnswer(Question question, int checkedIndex) {
    _isAnswered = true;
    _correctAnswer = question.answer!;
    _selectedAnswer = checkedIndex;

    if (_correctAnswer == _selectedAnswer) {
      _numOfCorrectAnswers++;
    }

    _animationController!.stop();
    update();

    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController!.nextPage(
        duration: Duration(milliseconds: 250),
        curve: Curves.ease,
      );
      _animationController!.reset();
      _animationController!.forward().whenComplete(nextQuestion);
    } else {
      Navigator.pushNamed(
          NavigationService.navigatorKey.currentContext!, ScoreScreen.routeName);
    }
  }

  void updateTheQuestionNumber(int index) {
    _questionNumber.value = index + 1;
  }

  static void disposeController() {
    Get.delete<QuestionController>();
  }
}
