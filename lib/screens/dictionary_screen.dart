import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/widgets/dictionary_widget/dictionary_body.dart';
import 'package:learning_english_flutter_app/widgets/dictionary_widget/meaning_word.dart';
import 'package:learning_english_flutter_app/widgets/dictionary_widget/search_word__tff.dart';
import 'package:flutter/services.dart';


class DictionaryScreen extends StatefulWidget {
  static const String routeName = '/dictionary_screen';

  const DictionaryScreen({Key? key}) : super(key: key);

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SearchWordTff(
                inputController: inputController,
                func: () {
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 10,
              ),
              inputController.text.isEmpty
                  ? const DictionaryBody()
                  : MeaningWord(inputController: inputController),
            ],
          ),
        ),
      ),
    );
  }
}