import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/models/slide_model.dart';
import 'package:learning_english_flutter_app/widgets/on_boarding_widget/page_index_indicator.dart';

class BottomSheetItem extends StatelessWidget {
  final List<SlideModel> slides;
  final int currentIndex;
  final VoidCallback jumpToLastPage;
  final VoidCallback jumpToPreviousPage;
  final VoidCallback jumpToNextPage;

  const BottomSheetItem({
    Key? key,
    required this.slides,
    required this.currentIndex,
    required this.jumpToLastPage,
    required this.jumpToPreviousPage,
    required this.jumpToNextPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(246, 242, 249, 1),
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              child: Text(
                'BACK',
                style: TextStyle(
                  fontSize: 16,
                  color: currentIndex != 0
                      ? Theme.of(context).primaryColor
                      : const Color.fromRGBO(246, 242, 249, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: currentIndex != 0 ? jumpToPreviousPage : null,
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < slides.length; i++)
                currentIndex == i
                    ? const PageIndexIndicator(isCurrentPage: true)
                    : const PageIndexIndicator(isCurrentPage: false),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              child: Text(
                'NEXT',
                style: TextStyle(
                  fontSize: 16,
                  color: currentIndex != 2
                      ? Theme.of(context).primaryColor
                      : const Color.fromRGBO(246, 242, 249, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: currentIndex != 0 ? jumpToNextPage : null,
            ),
          ),
        ],
      ),
    );
  }
}
