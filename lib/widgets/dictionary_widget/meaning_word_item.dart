import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/models/dictionary_model.dart';

class MeaningWordItem extends StatefulWidget {
  final List<Meaning> meanings;
  final String word;
  final List<Phonetic> phonetics;
  final int index;

  const MeaningWordItem({
    Key? key,
    required this.meanings,
    required this.word,
    required this.phonetics,
    required this.index,
  }) : super(key: key);

  @override
  State<MeaningWordItem> createState() => _MeaningWordItemState();
}

class _MeaningWordItemState extends State<MeaningWordItem> {
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
    print('NUMBER OF MEANING: ${widget.meanings.length}');
    final meanings = widget.meanings;
    final widgetIndex = widget.index;
    final phonetics = widget.phonetics;
    final word = widget.word;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  capitalize(meanings[widgetIndex].partOfSpeech!),
                  style: const TextStyle(
                      color: Color.fromRGBO(96, 98, 125, 1),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto'),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    final path = phonetics[widgetIndex].audio.toString().isEmpty
                        ? phonetics[0].audio
                        : phonetics[widgetIndex].audio;
                    playAudio(path as String);
                  },
                  icon: const Icon(Icons.volume_up_rounded),
                )
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  capitalize(word),
                  style: const TextStyle(
                      color: Color.fromRGBO(142, 142, 170, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto'),
                ),
                const SizedBox(width: 20),
                Text(
                  phonetics.length > widgetIndex - 1
                      ? phonetics[0].text!
                      : phonetics[widgetIndex].text as String,
                  style: const TextStyle(
                      color: Colors.grey, fontSize: 18, fontFamily: 'Roboto'),
                ),
              ],
            ),
            const SizedBox(height: 14),
            ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 15);
              },
              itemCount: meanings[widgetIndex].definitions!.length >= 3
                  ? 3
                  : meanings[widgetIndex].definitions!.length,
              itemBuilder: (context, index) {
                return Text(
                  "${index + 1}. ${meanings[widgetIndex].definitions![index].definition!}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    letterSpacing: 0.8,
                    color: Colors.grey,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  String capitalize(String data) {
    return "${data[0].toUpperCase()}${data.substring(1).toLowerCase()}";
  }
}
