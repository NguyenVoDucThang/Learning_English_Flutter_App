import 'package:flutter/material.dart';

class FlashCardView extends StatelessWidget {
  final String text;

  const FlashCardView({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color.fromRGBO(104, 105, 173, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Text(text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
            )),
      ),
    );
  }
}
