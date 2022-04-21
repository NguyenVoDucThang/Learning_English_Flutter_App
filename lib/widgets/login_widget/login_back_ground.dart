import 'package:flutter/material.dart';

class LoginBackGround extends StatelessWidget {
  final Widget widget;
  const LoginBackGround({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: -150,
              left: -150,
              child: Image.asset(
                'assets/images/main_top.png',
                width: size.width + 0.35,
              )
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/login_bottom.png',
              width: size.width * 0.4,
            ),
          ),
          widget,
        ],
      ),
    );
  }
}
