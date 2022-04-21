import 'package:flutter/material.dart';

import 'custom_icon_text_field.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomIconTextField(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: const Color(0xFF6F35A5),
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
