import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../../models/dictionary_model.dart';
import 'custom_back_flash_card.dart';
import 'custom_font_flash_card.dart';

class CustomFlashCard extends StatelessWidget {
  final DictionaryModel word;
  const CustomFlashCard({Key? key, required this.word,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 350,
      child: FlipCard(
        front: CustomFontFlashCard(word: word,),
        back: CustomBackFlashCard(word: word,),
      ),
    );
  }
}
