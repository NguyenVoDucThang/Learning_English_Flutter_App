import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/helpers/dictionary_service.dart';
import 'package:learning_english_flutter_app/models/dictionary_model.dart';

import 'meaning_word_item.dart';

class MeaningWord extends StatefulWidget {
  final TextEditingController inputController;

  const MeaningWord({
    Key? key,
    required this.inputController,
  }) : super(key: key);

  @override
  State<MeaningWord> createState() => _MeaningWordState();
}

class _MeaningWordState extends State<MeaningWord> {
  AudioPlayer? audioPlayer;

  @override
  void initState() {
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
    return FutureBuilder(
      future: DictionaryService().getMeaning(word: widget.inputController.text),
      builder: (context, AsyncSnapshot<List<DictionaryModel>> snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 5),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = snapshot.data!;
                  return MeaningWordItem(
                    index: index,
                    data: data,
                    playAudio: () {
                      final path = data[index].phonetics![index].audio;
                      playAudio(path as String);
                    },
                  );
                },
              ),
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
