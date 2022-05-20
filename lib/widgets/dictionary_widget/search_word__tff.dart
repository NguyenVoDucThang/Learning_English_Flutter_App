import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/widgets/dictionary_widget/search_background.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'custom_square_button.dart';

class SearchWordTff extends StatefulWidget {
  final TextEditingController inputController;
  final VoidCallback func;

  const SearchWordTff({
    Key? key,
    required this.inputController,
    required this.func,
  }) : super(key: key);

  @override
  State<SearchWordTff> createState() => _SearchWordTffState();
}

class _SearchWordTffState extends State<SearchWordTff> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  double _confidence = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBackground(
      listButton: CustomSquareButton(
        icon: Icons.mic_rounded,
        title: "microphone",
        func: () {
          createAlertDialog(context);
          _listen();
        },
      ),
      searchWidget: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.9,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: widget.inputController,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(181, 181, 181, 1.0),
                      fontFamily: 'FredokaOne',
                      fontWeight: FontWeight.w100,
                    ),
                    hintText: 'Search here',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                onPressed: widget.func,
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  createAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(224, 62, 62, 1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.mic_none_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() => _isListening = false);
                  _speech.stop();
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            widget.inputController.text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    }
  }
}
