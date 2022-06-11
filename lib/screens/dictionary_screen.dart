import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:learning_english_flutter_app/widgets/dictionary_widget/dictionary_body.dart';
import 'package:learning_english_flutter_app/widgets/dictionary_widget/meaning_word.dart';
import 'package:learning_english_flutter_app/widgets/dictionary_widget/search_word__tff.dart';
import 'package:learning_english_flutter_app/widgets/dictionary_widget/word_of_day.dart';

import '../helpers/dictionary_service.dart';
import 'drawer_screen.dart';

class DictionaryScreen extends StatefulWidget {
  static const String routeName = '/dictionary_screen';

  const DictionaryScreen({Key? key}) : super(key: key);

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  TextEditingController inputController = TextEditingController();
  int numOfWords = 0;
  bool isWordExisted = true;

  @override
  Widget build(BuildContext context) {
    String searchWords = inputController.text;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      // key: _scaffoldKey,
      drawer: const DrawerScreen(),
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
                func: () async {
                  searchWords = inputController.text;
                  isWordExisted = await isExisted().whenComplete(() {
                    numOfWords = searchWords.split(' ').length;
                    if (!isWordExisted) {
                      Navigator.pushNamed(context, '/translate_screen',
                          arguments: searchWords);
                      inputController.text = '';
                    } else if (numOfWords == 1) {
                      setState(() {});
                    } else {
                      Navigator.pushNamed(context, '/translate_screen',
                          arguments: searchWords);
                      inputController.text = '';
                    }
                  });
                },
                openDrawer: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
              inputController.text == ''
                  ? const WorldOfDay()
                  : DictionaryBody(inputController: inputController),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> isExisted() async {
    DictionaryService().getMeaning(word: inputController.text).then((value) {
      if (value.isEmpty) {
        isWordExisted = true;
      } else {
        isWordExisted = false;
      }
    });
    return isWordExisted;
  }
}
