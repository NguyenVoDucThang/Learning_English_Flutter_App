import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/screens/dictionary_screen.dart';
import 'package:learning_english_flutter_app/screens/flash_card_screen.dart';
import 'package:learning_english_flutter_app/screens/login_screen.dart';
import 'package:learning_english_flutter_app/screens/quiz_catalog_screen.dart';
import 'package:learning_english_flutter_app/screens/quiz_screen/quiz_screen.dart';
import 'package:learning_english_flutter_app/screens/score_screen/score_screen.dart';
import 'package:learning_english_flutter_app/screens/sign_up_screen.dart';
import 'package:learning_english_flutter_app/screens/translate_screen.dart';
import 'package:learning_english_flutter_app/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

import 'helpers/auth_services.dart';
import 'helpers/facebook_auth_controller.dart';
import 'helpers/google_auth_controller.dart';
import 'helpers/navigator_helper.dart';
import 'screens/introduction_of_flash_card_screen.dart';
import 'models/user_model.dart';
import 'screens/on_boarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
          initialData: null,
        ),
        FutureProvider.value(
          value: UserModel.fromFirebase().catchError((e) async {
            print('==========MAIN.DART==========');
            print('THERE IS NO USER');
            return UserModel(name: '', uid: '', email: '');
          }),
          initialData: null,
        ),
        ChangeNotifierProvider(
          create: (_) => GoogleAuthController(),
        ),
        ChangeNotifierProvider(
          create: (_) => FacebookAuthController(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'OpenSans',
          primaryColor: const Color.fromRGBO(104, 105, 173, 1),
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'OpenSans'),
          ),
        ),
        initialRoute: '/',
        routes: {
          WelcomeScreen.routeName: (context) => const WelcomeScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          SignUpScreen.routeName: (context) => const SignUpScreen(),
          DictionaryScreen.routeName: (context) => const DictionaryScreen(),
          FlashCardScreen.routeName: (context) => const FlashCardScreen(),
          IntroductionOfFlashCard.routeName: (context) => const IntroductionOfFlashCard(),
          TranslateScreen.routeName: (context) => const TranslateScreen(),
          QuizScreen.routeName: (context) => const QuizScreen(),
          ScoreScreen.routeName: (context) => const ScoreScreen(),
          QuizCatalogScreen.routeName: (context) => const QuizCatalogScreen(),
        },
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const OnBoardingScreen();
  }
}
