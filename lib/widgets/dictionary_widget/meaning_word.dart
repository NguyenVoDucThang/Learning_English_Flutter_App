import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/models/dictionary_model.dart';

import 'list_meaning_word.dart';

class MeaningWord extends StatelessWidget {
  final List<DictionaryModel> listDictionaryModel;

  const MeaningWord({
    Key? key,
    required this.listDictionaryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 5),
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return ListMeaningWord(
          data: listDictionaryModel[0],
        );
      },
    );
  }
}
