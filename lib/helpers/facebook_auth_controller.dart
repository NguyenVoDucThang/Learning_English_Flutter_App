import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/models/user_model.dart';
import 'package:learning_english_flutter_app/screens/dictionary_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'auth_services.dart';

class FacebookAuthController extends ChangeNotifier {
  dynamic _facebookUserData;
  bool _isLogin = false;

  dynamic get facebookUserData => _facebookUserData.toString();

  bool get isLogin => _isLogin;

  Future logIn() async {
    final LoginResult loginResult;
    // Trigger the sign-in flow
    try {
      loginResult = await FacebookAuth.instance.login();
    } catch (e) {
      _isLogin = false;
      return;
    }
    _isLogin = true;
    _facebookUserData =
    await FacebookAuth.instance.getUserData(fields: 'email');

    // Create a credential from the access token
    final AuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}

loginWithFacebook(BuildContext context) async {
  var facebookAuthProvider =
  Provider.of<FacebookAuthController>(context, listen: false);
  await facebookAuthProvider.logIn().whenComplete(() {
    Navigator.pushNamed(context, DictionaryScreen.routeName);
    print("==========${FirebaseAuth.instance.currentUser!.displayName == null ? 'null' : '${FirebaseAuth.instance.currentUser!.displayName}'}==========");
  });

  // bool isSignUp = await AuthService.isSignUp();
  // var _auth = FirebaseAuth.instance.currentUser;
  // if (facebookAuthProvider.isLogin && isSignUp == false) {
  //   postDetailToFireStore(
  //     _auth!.email as String,
  //     _auth.displayName as String,
  //     _auth.uid,
  //   );
  //   Navigator.pushNamed(context, DictionaryScreen.routeName);
  // } else if (facebookAuthProvider.isLogin && isSignUp == true) {
  //   Navigator.pushNamed(context, DictionaryScreen.routeName);
  // } else {
  //   const snackBar =
  //   SnackBar(content: Text('Problem with google authentication'));
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }
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
