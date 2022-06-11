import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/helpers/dictionary_service.dart';
import 'package:learning_english_flutter_app/models/dictionary_model.dart';

import '../../screens/translate_screen.dart';
import 'custom_card.dart';
import 'meaning_word.dart';

class DictionaryBody extends StatelessWidget {
  final TextEditingController inputController;

  const DictionaryBody({
    Key? key,
    required this.inputController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DictionaryService().getMeaning(word: inputController.text),
        builder: (context, AsyncSnapshot<List<DictionaryModel>> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return Expanded(
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      MeaningWord(listDictionaryModel: data),
                      data[0].meanings![0].synonyms!.isEmpty
                          ? const SizedBox()
                          : CustomCard(
                              title: 'Synonyms',
                              listThesaurus: data[0].meanings![0].synonyms
                                  as List<dynamic>,
                            ),
                      data[0].meanings![0].antonyms!.isEmpty
                          ? const SizedBox()
                          : CustomCard(
                        title: 'Antonyms',
                        listThesaurus: data[0].meanings![0].antonyms
                        as List<dynamic>,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            // return Text(snapshot.error.toString());
            Navigator.pushNamed(context, '/translate_screen',
                arguments: inputController.text);
            inputController.text = '';
            return const SizedBox();
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
