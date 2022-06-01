import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/helpers/dictionary_service.dart';
import 'package:learning_english_flutter_app/models/dictionary_model.dart';
import 'package:learning_english_flutter_app/widgets/dictionary_widget/wrap_chip_widget.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final List<dynamic> listThesaurus;

  const CustomCard({
    Key? key,
    required this.title,
    required this.listThesaurus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> list = listThesaurus.map((s) => s.toString()).toList();

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Color.fromRGBO(96, 98, 125, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            ),
            const SizedBox(height: 5),
            WrapChipWidget(listString: list,),
          ],
        ),
      ),
    );
  }
}
