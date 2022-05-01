import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learning_english_flutter_app/models/user_model.dart';
import 'package:learning_english_flutter_app/screens/dictionary_screen.dart';
import 'package:learning_english_flutter_app/screens/login_screen.dart';
import 'package:provider/provider.dart';

import 'auth_services.dart';

class GoogleAuthController extends ChangeNotifier {
  final _googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _googleUser;

  GoogleSignInAccount get googleUser => _googleUser!;

  Future logIn() async {
    final googleAccount = await _googleSignIn.signIn();

    if (googleAccount == null) return;
    _googleUser = googleAccount;

    final googleAuth = await _googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    notifyListeners();
  }
}

loginWithGoogle(BuildContext context) async {
  var googleAuthProvider =
      Provider.of<GoogleAuthController>(context, listen: false);

  await googleAuthProvider.logIn();
  bool isSignUp = await AuthService.isSignUp();
  if (googleAuthProvider.googleUser.id.isNotEmpty && isSignUp == false) {
    postDetailToFireStore(
      googleAuthProvider.googleUser.email,
      googleAuthProvider.googleUser.displayName as String,
      googleAuthProvider.googleUser.id,
    );
    Navigator.pushNamed(context, DictionaryScreen.routeName);
  } else if (googleAuthProvider.googleUser.id.isNotEmpty && isSignUp == true) {
    Navigator.pushNamed(context, DictionaryScreen.routeName);
  } else {
    const snackBar =
        SnackBar(content: Text('Problem with google authentication'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

postDetailToFireStore(String email, String name, String id) async {
  UserModel userModel = UserModel();
  userModel.email = email;
  userModel.uid = id;
  userModel.name = name;

  await FirebaseFirestore.instance
      .collection('users')
      .doc(id)
      .set(userModel.toMap());
}
