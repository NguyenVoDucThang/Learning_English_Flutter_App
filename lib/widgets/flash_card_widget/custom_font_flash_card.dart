import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../models/dictionary_model.dart';

class CustomFontFlashCard extends StatefulWidget {
  final DictionaryModel word;

  const CustomFontFlashCard({Key? key, required this.word}) : super(key: key);

  @override
  State<CustomFontFlashCard> createState() => _CustomFontFlashCardState();
}

class _CustomFontFlashCardState extends State<CustomFontFlashCard> {
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
    return Card(
      elevation: 0,
      color: const Color.fromRGBO(104, 105, 173, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            widget.word.word as String,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 45,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.word.phonetic as String,
            style: const TextStyle(
              fontFamily: 'ArialUnicodeMS',
              color: Colors.white54,
              fontWeight: FontWeight.w500,
              fontSize: 23,
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () {
                final path = widget.word.phonetics![0].audio.toString();
                playAudio(path);
              },
              icon: const Icon(
                Icons.volume_up_rounded,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
