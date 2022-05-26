import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/models/dictionary_model.dart';

import 'meaning_word_item.dart';

class ListMeaningWord extends StatelessWidget {
  final DictionaryModel data;

  const ListMeaningWord({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.meanings!.length >= 3 ? 3 : data.meanings!.length,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 20,
        );
      },
      itemBuilder: (context, index) {
        return MeaningWordItem(
          word: data.word!,
          meanings: data.meanings!,
          phonetics: data.phonetics!,
          index: index,
        );
      },
    );
  }
}
