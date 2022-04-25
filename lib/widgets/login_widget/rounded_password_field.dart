import 'package:flutter/material.dart';

import 'custom_icon_text_field.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final String? Function(String?) validator;

  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.hintText,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomIconTextField(
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        obscureText: true,
        decoration:  InputDecoration(
          hintText: hintText,
          icon: const Icon(
            Icons.lock,
            color: Color(0xFF6F35A5),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
