import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/models/dictionary_model.dart';

import '../../helpers/dictionary_service.dart';
import '../../models/flash_card_model.dart';
import 'custom_flash_card.dart';
import 'custom_outline_button.dart';
import 'custom_reset_button.dart';
import 'custom_title.dart';
import 'flash_card_view.dart';
import 'navigator_buttons.dart';

class FlashCardBody extends StatelessWidget {
  final VoidCallback nextCard;
  final VoidCallback previousCard;
  final VoidCallback refreshWord;
  final int currentIndex;
  final List<String> listString;

  const FlashCardBody({
    Key? key,
    required this.nextCard,
    required this.previousCard,
    required this.currentIndex,
    required this.listString,
    required this.refreshWord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DictionaryService()
          .getMeaning(word: listString.elementAt(currentIndex)),
      builder: (context, AsyncSnapshot<List<DictionaryModel>> snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              const CustomTitle(),
              const SizedBox(height: 10),
              CustomFlashCard(word: data[0]),
              const SizedBox(height: 10),
              Text(
                "${currentIndex + 1}/${listString.length}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 20),
              NavigatorButtons(
                nextCard: nextCard,
                previousCard: previousCard,
              ),
              const SizedBox(height: 20),
              CustomResetButton(
                onPressed: refreshWord,
                label: 'Reset FlashCard',
                icon: Icons.autorenew_rounded,
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
