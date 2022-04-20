import 'package:flutter/material.dart';

class SlideTile extends StatelessWidget {
  final String imageAssetPath;
  final String title;
  final String description;

  const SlideTile({
    Key? key,
    required this.imageAssetPath,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageAssetPath),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600 ,
            ),
          ),
          const SizedBox(height: 17),
          Text(description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              )),
        ],
      ),
    );
  }
}
