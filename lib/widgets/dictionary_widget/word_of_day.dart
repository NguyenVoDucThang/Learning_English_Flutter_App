import 'package:audioplayers/audioplayers.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/helpers/dictionary_service.dart';
import 'package:learning_english_flutter_app/models/dictionary_model.dart';
import 'package:learning_english_flutter_app/widgets/dictionary_widget/word_of_the_day_text.dart';

import 'custom_card_word.dart';

class WorldOfDay extends StatefulWidget {
  const WorldOfDay({Key? key}) : super(key: key);

  @override
  State<WorldOfDay> createState() => _WorldOfDayState();
}

class _WorldOfDayState extends State<WorldOfDay> {
  AudioPlayer? audioPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      audioPlayer = AudioPlayer();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer!.dispose();
  }

  void playAudio(String music) {
    audioPlayer!.stop();

    audioPlayer!.play(music);
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.90,
      child: Center(
        child: FutureBuilder(
          future: DictionaryService()
              .getMeaning(word: nouns.take(1).first.toString()),
          builder: (context, AsyncSnapshot<List<DictionaryModel>> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  const SizedBox(height: 10),
                  const WordOfTheDayText(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.67,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final data = snapshot.data!;
                          return CustomCardWord(
                            index: index,
                            data: data,
                            playAudio: () {
                              final path = data[index].phonetics![index].audio;
                              playAudio(path as String);
                            },
                          );
                        }),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
