import 'package:flutter/material.dart';

class WrapChipWidget extends StatelessWidget {
  final List<String> listString;

  const WrapChipWidget({
    Key? key,
    required this.listString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14,
      runSpacing: 0,
      children: List<Widget>.generate(listString.length, (int index) {
        return Chip(
          label: Text(
            listString[index],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          backgroundColor: const Color.fromRGBO(142, 142, 170, 1),
        );
      }).toList(),
    );
  }
}
