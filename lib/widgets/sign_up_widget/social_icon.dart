import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPress;
  const SocialIcon({
    Key? key,
    required this.imagePath,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: const Color(0xFFF1E6FF),
          ),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          imagePath,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
