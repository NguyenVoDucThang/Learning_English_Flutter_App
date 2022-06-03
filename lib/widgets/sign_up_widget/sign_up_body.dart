import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/helpers/auth_services.dart';
import 'package:learning_english_flutter_app/helpers/facebook_auth_controller.dart';
import 'package:learning_english_flutter_app/helpers/google_auth_controller.dart';
import 'package:learning_english_flutter_app/models/user_model.dart';
import 'package:learning_english_flutter_app/screens/dictionary_screen.dart';
import 'package:learning_english_flutter_app/widgets/login_widget/already_have_account.dart';
import 'package:learning_english_flutter_app/widgets/login_widget/rounded_input_field.dart';
import 'package:learning_english_flutter_app/widgets/login_widget/rounded_password_field.dart';
import 'package:learning_english_flutter_app/widgets/on_boarding_widget/rounded_button.dart';
import 'package:learning_english_flutter_app/widgets/sign_up_widget/sign_up_back_ground.dart';
import 'package:learning_english_flutter_app/widgets/sign_up_widget/social_icon.dart';
import 'package:provider/src/provider.dart';

import '../../screens/login_screen.dart';
import 'form_error.dart';
import 'or_divider.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  final RegExp emailRegExp = RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]");
  final RegExp nameRegExp = RegExp(r'^.{3,}$');
  final RegExp passwordRegExp = RegExp(r'^.{6,}$');

  final _auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignUpBackGround(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/signup.png',
                height: size.height * 0.25,
              ),
              const SizedBox(height: 8),
              RoundedInputField(
                textCapitalization: TextCapitalization.none,
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
                hintText: 'Your email',
                icon: Icons.person,
              ),
              const SizedBox(height: 8),
              RoundedInputField(
                textCapitalization: TextCapitalization.words,
                onChanged: (value) {
                  nameController.text = value;

                  if (nameController.text.isNotEmpty &&
                      errors.contains("Please enter your name")) {
                    setState(() {
                      errors.remove("Please enter your name");
                    });
                  }
                  if (nameRegExp.hasMatch(value) &&
                      errors.contains("Please enter a valid name")) {
                    setState(() {
                      errors.remove("Please enter a valid name");
                    });
                  }
                  return;
                },
                validator: (value) {
                  if (nameController.text.isEmpty &&
                      !errors.contains("Please enter your name")) {
                    setState(() {
                      errors.add("Please enter your name");
                    });
                  }
                  if (!nameRegExp.hasMatch(nameController.text) &&
                      !errors.contains("Please enter a valid name")) {
                    setState(() {
                      errors.add("Please enter a valid name");
                    });
                  }
                  return null;
                },
                hintText: 'Your Name',
                icon: Icons.drive_file_rename_outline,
              ),
              const SizedBox(height: 8),
              RoundedPasswordField(
                hintText: 'Password',
                onChanged: (value) {
                  passwordController.text = value;

                  if (passwordController.text.isNotEmpty &&
                      errors.contains("Password is required for login")) {
                    setState(() {
                      errors.remove("Password is required for login");
                    });
                  }
                  if (passwordRegExp.hasMatch(passwordController.text) &&
                      errors.contains("Enter valid password")) {
                    setState(() {
                      errors.remove("Enter valid password");
                    });
                  }
                  return;
                },
                validator: (value) {
                  if (passwordController.text.isEmpty &&
                      !errors.contains("Password is required for login")) {
                    setState(() {
                      errors.add("Password is required for login");
                    });
                  }
                  if (!passwordRegExp.hasMatch(passwordController.text) &&
                      !errors.contains("Enter valid password")) {
                    setState(() {
                      errors.add("Enter valid password");
                    });
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              RoundedPasswordField(
                hintText: 'Confirm Password',
                onChanged: (value) {
                  confirmPasswordController.text = value;

                  if (confirmPasswordController.text !=
                          passwordController.text &&
                      errors.contains("Password don't match")) {
                    setState(() {
                      errors.remove("Password don't match");
                    });
                  }
                  return;
                },
                validator: (value) {
                  if (confirmPasswordController.text !=
                          passwordController.text &&
                      !errors.contains("Password don't match")) {
                    setState(() {
                      errors.add("Password don't match");
                    });
                  }

                  return null;
                },
              ),
              const SizedBox(height: 8),
              FormError(errors: errors),
              RoundedButton(
                text: 'SIGN UP',
                backgroundColor: const Color(0xFF6F35A5),
                onPressed: () {
                  signUp(
                    emailController.text,
                    passwordController.text,
                    context,
                  );
                },
                textColor: Colors.white,
              ),
              const SizedBox(height: 10),
              const AlreadyHaveAnAccount(
                login: false,
              ),
              const OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialIcon(
                    onPress: () async {
                      loginWithFacebook(context);
                    },
                    imagePath: 'assets/images/facebook.png',
                  ),
                  SocialIcon(
                    onPress: () async {
                      loginWithGoogle(context);
                    },
                    imagePath: 'assets/images/google.png',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void signUp(
    String email,
    String password,
    BuildContext context,
  ) async {
    if (_formKey.currentState!.validate()) {
      if (errors.isEmpty) {
        _formKey.currentState!.save();
        context
            .read<AuthService>()
            .signUpWithEmailAndPassword(email, password, context)
            .then((value) async {
          postDetailToFireStore();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Sign up successful")));
          Navigator.pushNamed(context, LoginScreen.routeName);
        }).catchError((e) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.toString())));
        });
      }
    }
  }

  postDetailToFireStore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameController.text;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap())
        .whenComplete(() {
      Navigator.of(context).pushNamed(DictionaryScreen.routeName);
    });
  }
}
