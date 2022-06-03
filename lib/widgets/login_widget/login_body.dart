import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/helpers/auth_services.dart';
import 'package:learning_english_flutter_app/screens/dictionary_screen.dart';
import 'package:learning_english_flutter_app/screens/welcome_screen.dart';
import 'package:learning_english_flutter_app/widgets/login_widget/rounded_input_field.dart';
import 'package:learning_english_flutter_app/widgets/login_widget/rounded_password_field.dart';
import 'package:learning_english_flutter_app/widgets/on_boarding_widget/rounded_button.dart';
import 'package:learning_english_flutter_app/widgets/sign_up_widget/form_error.dart';
import 'package:provider/src/provider.dart';

import 'already_have_account.dart';
import 'login_back_ground.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  final RegExp emailRegExp = RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]");
  final RegExp passwordRegExp = RegExp(r'^.{6,}$');
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return LoginBackGround(
      widget: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/login.png',
                height: size.height * 0.3,
              ),
              const SizedBox(height: 18),
              RoundedInputField(
                textCapitalization: TextCapitalization.none,
                icon: Icons.person,
                hintText: 'Your email',
                onChanged: (value) {
                  emailController.text = value;

                  if (emailController.text.isNotEmpty &&
                      errors.contains("Please enter your email")) {
                    setState(() {
                      errors.remove("Please enter your email");
                    });
                  }
                  if (emailRegExp.hasMatch(value) &&
                      errors.contains("Please enter a valid email address")) {
                    setState(() {
                      errors.remove("Please enter a valid email address");
                    });
                  }
                  return;
                },
                validator: (value) {
                  if (emailController.text.isEmpty &&
                      !errors.contains("Please enter your email")) {
                    setState(() {
                      errors.add("Please enter your email");
                    });
                  }
                  if (!emailRegExp.hasMatch(emailController.text) &&
                      !errors.contains("Please enter a valid email address")) {
                    setState(() {
                      errors.add("Please enter a valid email address");
                    });
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              RoundedPasswordField(
                hintText: 'Password',
                onChanged: (value) {
                  passwordController.text = value;

                  if (passwordController.text.isNotEmpty &&
                      errors.contains("Please enter your password")) {
                    setState(() {
                      errors.remove("Please enter your password");
                    });
                  }
                  if (passwordRegExp.hasMatch(value) &&
                      errors.contains("Please enter valid password")) {
                    setState(() {
                      errors.remove("Please enter valid password");
                    });
                  }
                },
                validator: (value) {
                  if (passwordController.text.isEmpty &&
                      !errors.contains("Please enter your password")) {
                    setState(() {
                      errors.add("Please enter your password");
                    });
                  }
                  if (!passwordRegExp.hasMatch(passwordController.text) &&
                      !errors.contains("Please enter valid password")) {
                    setState(() {
                      errors.add("Please enter valid password");
                    });
                  }
                },
              ),
              const SizedBox(height: 10),
              FormError(errors: errors),
              RoundedButton(
                textColor: Colors.white,
                text: 'LOGIN',
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  logIn(
                    emailController.text,
                    passwordController.text,
                    context,
                  );
                },
              ),
              const SizedBox(height: 10),
              const AlreadyHaveAnAccount(login: true),
            ],
          ),
        ),
      ),
    );
  }

  void logIn(String email, String password, BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (errors.isEmpty) {
        _formKey.currentState!.save();
        context
            .read<AuthService>()
            .signInWithEmailAndPassword(email, password, context);
      }
    }
  }
}
