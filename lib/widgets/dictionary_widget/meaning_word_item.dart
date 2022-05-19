import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/models/dictionary_model.dart';

class MeaningWordItem extends StatelessWidget {
  final List<DictionaryModel> data;
  final int index;
  final VoidCallback playAudio;

  const MeaningWordItem({
    Key? key,
    required this.data,
    required this.index,
    required this.playAudio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  capitalize(data[index].meanings![index].partOfSpeech!),
                  style: const TextStyle(
                      color: Color.fromRGBO(142, 142, 170, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto'),
                ),
                const Spacer(),
                IconButton(
                  onPressed: playAudio,
                  icon: const Icon(Icons.audiotrack),
                )
              ],
            ),
            // const SizedBox(height:5),
            Row(
              children: [
                Text(
                  capitalize(data[index].word as String),
                  style: const TextStyle(
                      color: Color.fromRGBO(96, 98, 125, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto'),
                ),
                const SizedBox(width: 20),
                Text(
                  data[index].phonetics![index].text!,
                  style: const TextStyle(
                      color: Colors.grey, fontSize: 16, fontFamily: 'Roboto'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              data[index].meanings![index].definitions![index].definition!,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String capitalize(String data) {
    return "${data[0].toUpperCase()}${data.substring(1).toLowerCase()}";
  }
}
