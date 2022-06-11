import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/models/dictionary_model.dart';

class CustomCardWord extends StatelessWidget {
  final List<DictionaryModel> data;
  final int index;
  final VoidCallback playAudio;

  const CustomCardWord({
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
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data[index].word as String,
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: playAudio,
                  icon: const Icon(Icons.volume_up_rounded),
                ),
              ],
            ),
            Text(
              data[index].phonetics![index].text!,
              style: const TextStyle(
                color: Color.fromRGBO(97, 97, 97, 1.0),
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 22),
            Text(data[index].meanings![index].definitions![index].definition!,
              style: const TextStyle(
                color: Color.fromRGBO(111, 111, 111, 1),
                fontSize: 18,
              ),),
          ],
        ),
      ),
    );
  }
}
