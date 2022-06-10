import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import '../models/flash_card_model.dart';
import '../widgets/flash_card_widget/flash_card_body.dart';

class FlashCardScreen extends StatefulWidget {
  static const String routeName = '/flash_card_screen';

  const FlashCardScreen({Key? key}) : super(key: key);

  @override
  State<FlashCardScreen> createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  List<String> listRandomWord = [];

  @override
  void initState() {
    // TODO: implement initState
    generateNous();
    super.initState();
  }

  generateNous() {
    print("==================================");
    nouns.take(5).forEach((element) {
      print(element);
      listRandomWord.add(element.toString());
    });
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 60,
        title: const Text(
          "FlashCard",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(104, 105, 173, 1),
                Color.fromRGBO(12, 18, 117, 1),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ),
      body: FlashCardBody(
        currentIndex: _currentIndex,
        listString: listRandomWord,
        nextCard: nextCard,
        previousCard: previousCard,
        refreshWord: refreshWord,
      ),
    );
  }

  void nextCard() {
    setState(() {
      _currentIndex =
          (_currentIndex + 1 < listRandomWord.length) ? _currentIndex + 1 : 0;
    });
  }

  void refreshWord() {}

  void previousCard() {
    setState(() {
      _currentIndex = (_currentIndex - 1 >= 0)
          ? _currentIndex - 1
          : listRandomWord.length - 1;
    });
  }
}
