import 'package:flutter/material.dart';

class CustomSquareButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback func;
  final String title;

  const CustomSquareButton({
    Key? key,
    required this.icon,
    required this.func,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(143, 143, 210, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: Colors.white,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.white,
                    fontSize: 11,
                  )
                ),
              ],
            ),
          ),
        ),

    );
  }
}
