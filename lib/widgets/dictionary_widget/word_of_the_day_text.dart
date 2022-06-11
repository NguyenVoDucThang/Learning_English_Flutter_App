import 'package:flutter/material.dart';

class WordOfTheDayText extends StatelessWidget {
  const WordOfTheDayText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: const [
        Center(
          child: Text(
            "Word of the day",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: Text(
            "Build your vocabulary with new words and definitions every day of the week",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 19,
              fontWeight: FontWeight.w500 ,
            ),
          ),
        ),
      ],
    );
  }
}
