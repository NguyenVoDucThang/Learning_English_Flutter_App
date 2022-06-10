import 'package:flutter/material.dart';

import '../../models/dictionary_model.dart';

class CustomBackFlashCard extends StatelessWidget {
  final DictionaryModel word;

  const CustomBackFlashCard({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color.fromRGBO(104, 105, 173, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            word.meanings![0].definitions![0].definition.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
