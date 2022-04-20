import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/models/on_boarding_screen/data/slide_model.dart';
import 'package:learning_english_flutter_app/models/on_boarding_screen/widgets/page_index_indicator.dart';

class BottomSheetItem extends StatelessWidget {
  final List<SlideModel> slides;
  final int currentIndex;
  final VoidCallback jumpToLastPage;
  final VoidCallback jumpToNextPage;

  const BottomSheetItem({
    Key? key,
    required this.slides,
    required this.currentIndex,
    required this.jumpToLastPage,
    required this.jumpToNextPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Text(
              'SKIP',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: jumpToLastPage,
          ),
          Row(
            children: [
              for (int i = 0; i < slides.length; i++)
                currentIndex == i
                    ? const PageIndexIndicator(isCurrentPage: true)
                    : const PageIndexIndicator(isCurrentPage: false),
            ],
          ),
          GestureDetector(
            child: Text(
              'NEXT',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: jumpToNextPage,
          ),
        ],
      ),
    );
  }
}
