import 'package:flutter/material.dart';

class CustomIconTextField extends StatelessWidget {
  final Widget child;

  const CustomIconTextField({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: const Color(0xFFF1E6FF),
          borderRadius: BorderRadius.circular(29),
        ),
        child: child,
    );
  }
}
