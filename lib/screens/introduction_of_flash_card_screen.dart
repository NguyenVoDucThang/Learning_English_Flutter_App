import 'package:flutter/material.dart';

import '../widgets/on_boarding_widget/rounded_button.dart';
import 'flash_card_screen.dart';

class IntroductionOfFlashCard extends StatelessWidget {
  static const String routeName = '/introduction_of_flash_card';

  const IntroductionOfFlashCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _funFact =
        "Do you know flash card play significant role on helping active memorization of new concepts through visual and auditory reception.";
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30,),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF496AE1),
            Color.fromRGBO(62, 64, 140, 1),
          ],
        ),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/images/wavy.png',
                height: 250,
                width: 250,
              ),
            ),
            const SizedBox(height: 30),

            const Text(
              "Flash Card",
              textAlign: TextAlign.left,
              style: TextStyle(
                letterSpacing: 1.1,
                color: Colors.white70,
                fontSize: 35,
                fontWeight: FontWeight.w600,
                fontFamily: 'Raleway',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _funFact,
              style: const TextStyle(
                height: 1.3,
                color: Colors.white54,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Raleway',
              ),
            ),
            const SizedBox(height: 60),
            RoundedButton(
              text: "Get Started",
              backgroundColor: Colors.white70,
              onPressed: () {
                Navigator.of(context).pushNamed(FlashCardScreen.routeName);
              },
              textColor: const Color.fromRGBO(62, 64, 140, 1),
            ),
          ],
        ),
      ),
    );
  }
}
