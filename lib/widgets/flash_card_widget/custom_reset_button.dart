import 'package:flutter/material.dart';

class CustomResetButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData icon;

  const CustomResetButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      height: 45,
      width: double.infinity,
      child: RawMaterialButton(
        fillColor: const Color.fromRGBO(104, 105, 173, 1),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 15),
              Icon(
                icon,
                color: Colors.white70,
                size: 20,
              ),
              const SizedBox(width: 15),
              Text(
                label,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 15),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: onPressed,
      ),
    );
  }
}
