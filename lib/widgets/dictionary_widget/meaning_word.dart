import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/helpers/dictionary_service.dart';
import 'package:learning_english_flutter_app/models/dictionary_model.dart';

import 'list_meaning_word.dart';

class MeaningWord extends StatelessWidget {
  final TextEditingController inputController;

  const MeaningWord({
    Key? key,
    required this.inputController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DictionaryService().getMeaning(word: inputController.text),
        builder: (context, AsyncSnapshot<List<DictionaryModel>> snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              // height: MediaQuery.of(context).size.height * 0.55,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 5),
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  final data = snapshot.data!;
                  return ListMeaningWord(
                    data: data[0],
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const CircularProgressIndicator();
          }
        },
      );
  }
}
