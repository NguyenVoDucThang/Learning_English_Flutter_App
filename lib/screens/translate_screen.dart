import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:translator/translator.dart';

class TranslateScreen extends StatefulWidget {
  static const String routeName = '/translate_screen';

  const TranslateScreen({Key? key}) : super(key: key);

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  final englishController = TextEditingController();
  final vietnameseController = TextEditingController();
  final translator = GoogleTranslator();
  String english = '';
  String vietnamese = '';

  @override
  void initState() {
    super.initState();
    print("-----------ALREADY INITIALIZED-----------");
    englishController.addListener(_onTextChange);
    vietnameseController.addListener(_onTextChange);
  }

  @override
  void dispose() {
    englishController.dispose();
    vietnameseController.dispose();
    super.dispose();
  }

  void _onTextChange() async {
    print("-----------ALREADY SET TEXT CHANGE HANDLE-----------");
    setState(() {
      english = englishController.text;
    });
    translator.translate(english, from: 'en', to: 'vi').then((result) {
      setState(() {
        vietnamese = result.toString();
        vietnameseController.text = vietnamese;
        print(
          "TRANSLATED: " + vietnamese,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.06 - 5,
            left: 10,
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 34,
              ),
              onPressed: () => ZoomDrawer.of(context)!.toggle(),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.06,
            child: const Text(
              "Translate",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'FredokaOne',
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.16,
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              height: MediaQuery.of(context).size.height * 0.5,
              child: TextFormField(
                controller: englishController,
                style: const TextStyle(color: Colors.white, fontSize: 22),
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'FredokaOne',
                  ),
                  labelText: 'English',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.58,
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              height: MediaQuery.of(context).size.height * 0.5,
              child: TextFormField(
                controller: vietnameseController,
                style: const TextStyle(color: Colors.white, fontSize: 22),
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'FredokaOne',
                  ),
                  labelText: 'Vietnamese',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
