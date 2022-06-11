import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:learning_english_flutter_app/models/question_model.dart';
import 'package:learning_english_flutter_app/screens/quiz_screen/quiz_screen.dart';

import '../controllers/question_controller.dart';
import 'drawer_screen.dart';

class QuizCatalogScreen extends StatefulWidget {
  static const String routeName = '/quiz_catalog_screen';

  const QuizCatalogScreen({Key? key}) : super(key: key);

  @override
  State<QuizCatalogScreen> createState() => _QuizCatalogScreenState();
}

class _QuizCatalogScreenState extends State<QuizCatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.asset(
              'assets/images/quiz_background.svg',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.06,
            child: const Text(
              "Let's Quiz",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'FredokaOne',
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: sample_catalog.map((catalog) {
                  return GestureDetector(
                    onTap: () {
                      data = catalog.questionData;
                      setState(() {
                        QuestionController.disposeController();
                        Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const QuizScreen(),
                          ),
                        );
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.11,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white.withOpacity(0.6),
                              Colors.indigo.withOpacity(0.5),
                            ],
                          ),
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 12,
                          ),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Topic: " + catalog.title,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Level: " + catalog.description,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Text(
                                  catalog.questionData.length.toString() +
                                      " Questions",
                                  style:  TextStyle(
                                    fontSize: 16,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 0,
                                child: Text(
                                  (catalog.questionData.length * 1).toString() +
                                      " Min",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
