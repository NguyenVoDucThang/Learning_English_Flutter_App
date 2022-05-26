import 'package:flutter/material.dart';

import 'meaning_word.dart';

class DictionaryBody extends StatelessWidget {
  final TextEditingController inputController;

  const DictionaryBody({
    Key? key,
    required this.inputController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          MeaningWord(
            inputController: inputController,
          ),
        ],
      ),
    );
  }
}
