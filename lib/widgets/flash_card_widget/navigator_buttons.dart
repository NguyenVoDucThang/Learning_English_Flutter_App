import 'package:flutter/material.dart';

import 'custom_outline_button.dart';

class NavigatorButtons extends StatelessWidget {
  final VoidCallback previousCard;
  final VoidCallback nextCard;

  const NavigatorButtons(
      {Key? key, required this.previousCard, required this.nextCard,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomOutlineButton(
            onPressed: previousCard,
            icon: Icons.arrow_back_rounded,
            label: "Back",
          ),
          CustomOutlineButton(
            onPressed: nextCard,
            icon: Icons.arrow_forward_rounded,
            label: "Next",
          ),
        ],
      ),
    );
  }
}
