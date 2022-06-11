import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_english_flutter_app/screens/dictionary_screen.dart';

class AuthService {
  FirebaseAuth _auth;

  AuthService(this._auth);

  Stream<User?> get authStateChanges => _auth.idTokenChanges();

  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
    return;
  }

  Future<String> signInWithEmailAndPassword(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Navigator.of(context).pushNamed(DictionaryScreen.routeName),
              })
          .catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email or password is incorrect'),
          ),
        );
      });
    } catch (e) {
      return e.toString();
    }
    return '==============SIGNED IN==============';
  }

  Future<String> signUpWithEmailAndPassword(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) {})
          .catchError((e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      });
    } catch (e) {
      return e.toString();
    }
    return '==============SIGNED UP==============';
  }

  static Future<bool> isSignUp() async {
    bool isSignUp = false;
    User? user = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      if (value.exists) {
        isSignUp = true;
        print('================SIGNED UP================');
      } else {
        print('===============UNSIGNED UP===============');
        isSignUp = false;
      }
    });
    return isSignUp;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
