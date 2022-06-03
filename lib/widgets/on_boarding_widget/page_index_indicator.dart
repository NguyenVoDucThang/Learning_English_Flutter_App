import 'package:flutter/material.dart';

class PageIndexIndicator extends StatelessWidget {
  final bool isCurrentPage;

  const PageIndexIndicator({
    Key? key,
    required this.isCurrentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 150.0),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? const Color.fromRGBO(167, 167, 236, 1.0) : const Color.fromRGBO(
            204, 204, 255, 1.0),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
