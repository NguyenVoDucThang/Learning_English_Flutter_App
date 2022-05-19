import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/widgets/dictionary_widget/search_background.dart';

import 'custom_square_button.dart';

class SearchWordTff extends StatelessWidget {
  final TextEditingController inputController;
  final VoidCallback func;

  const SearchWordTff({
    Key? key,
    required this.inputController,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchBackground(
      listButton: CustomSquareButton(
        icon: Icons.title,
        title: "scan",
        func: () {},
      ),
      searchWidget: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.9,
          height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: inputController,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(181, 181, 181, 1.0),
                      fontFamily: 'FredokaOne',
                      fontWeight: FontWeight.w100,
                    ),
                    hintText: 'Search here',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                onPressed: func,
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
