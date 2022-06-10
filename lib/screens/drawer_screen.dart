import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 200,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(245, 245, 245, 1),
        ),
    );
  }
}
