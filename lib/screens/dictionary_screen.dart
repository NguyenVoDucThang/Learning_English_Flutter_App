import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/models/user_model.dart';
import 'package:provider/provider.dart';

class DictionaryScreen extends StatelessWidget {
  static const String routeName = '/dictionary_screen';

  const DictionaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserModel>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('THIS IS USER NAME: ${user.name.toString()}'),
            Text('THIS IS USER UID: ${user.uid.toString()}'),
            Text('THIS IS USER EMAIL: ${user.email.toString()}'),
          ],
        ),
      ),
    );
  }
}
