import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/screens/flash_card_screen.dart';
import 'package:learning_english_flutter_app/screens/introduction_of_flash_card_screen.dart';
import 'package:learning_english_flutter_app/screens/quiz_catalog_screen.dart';
import 'package:learning_english_flutter_app/screens/quiz_screen/quiz_screen.dart';
import 'package:learning_english_flutter_app/screens/translate_screen.dart';

import '../widgets/drawer_screen/custom_name_email.dart';
import '../widgets/flash_card_widget/custom_outline_button.dart';
import 'dictionary_screen.dart';
import 'login_screen.dart';
import 'login_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: MediaQuery.of(context).size.height,
      width: 200,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(245, 245, 245, 1),
      ),
      child: ListView(
        children: <Widget>[
          const CustomNameEmail(),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(
              Icons.book_rounded,
              color: Color.fromRGBO(104, 105, 173, 1),
            ),
            title: const Text('Dictionary',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(104, 105, 173, 1),
                )),
            onTap: () => selectDestination(0),
          ),
          ListTile(
            leading: const Icon(
              Icons.translate_rounded,
              color: Color.fromRGBO(104, 105, 173, 1),
            ),
            title: const Text('Translate',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(104, 105, 173, 1),
                )),
            onTap: () => selectDestination(1),
          ),
          ListTile(
            leading: const Icon(
              Icons.games_rounded,
              color: Color.fromRGBO(104, 105, 173, 1),
            ),
            title: const Text('Flash Card',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(104, 105, 173, 1),
                )),
            onTap: () => selectDestination(2),
          ),
          ListTile(
            leading: const Icon(
              Icons.quiz_rounded,
              color: Color.fromRGBO(104, 105, 173, 1),
            ),
            title: const Text(
              'Quiz',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(104, 105, 173, 1),
              ),
            ),
            onTap: () => selectDestination(3),
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          const SizedBox(height: 330),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            child: CustomOutlineButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().whenComplete(() {
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                });
              },
              icon: Icons.exit_to_app_rounded,
              label: "Logout",
            ),
          ),
        ],
      ),
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
      navigator(_selectedDestination);
    });
  }

  void navigator(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed(DictionaryScreen.routeName);
        break;
      case 1:
        Navigator.of(context)
            .pushNamed(TranslateScreen.routeName, arguments: '');
        break;
      case 2:
        Navigator.of(context).pushNamed(IntroductionOfFlashCard.routeName);
        break;
      case 3:
        Navigator.of(context).pushNamed(QuizCatalogScreen.routeName);
        break;
    }
  }
}
