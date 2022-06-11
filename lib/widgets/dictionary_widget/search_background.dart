import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class SearchBackground extends StatelessWidget {
  final Widget searchWidget;
  final Widget listButton;
  final VoidCallback openDrawer;

  const SearchBackground({
    Key? key,
    required this.searchWidget,
    required this.listButton,
    required this.openDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.45,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          // Positioned(
          //   top: MediaQuery.of(context).size.height * 0.06 - 5,
          //   left: 10,
          //   child: IconButton(
          //     icon: const Icon(
          //       Icons.menu,
          //       color: Colors.white,
          //       size: 34,
          //     ),
          //     onPressed: openDrawer,
          //   ),
          // ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.06,
            child: const Text(
              "Dictionary",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'FredokaOne',
              ),
            ),
          ),
          Positioned(
            top: 125,
            child: searchWidget,
          ),
          Positioned(
            top: 205,
            child: listButton,
          ),
          Positioned(
            bottom: -2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(245, 245, 245, 1),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
