import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel {
  String? uid;
  String? email;
  String? name;

  UserModel({this.uid, this.email, this.name});

  //receiving data from server
  static Future<UserModel> fromFirebase() async {
    DocumentReference user = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);

    UserModel userModel = UserModel(uid: '', name: '', email: '');

    await user.get().then((user) {
      Map<String, dynamic> data = user.data() as Map<String, dynamic>;
      userModel =
          UserModel(email: data['email'], uid: data['uid'], name: data['name']);
    });

    return userModel;
  }

  //sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }
}
