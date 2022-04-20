import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/models/on_boarding_screen/data/slide_model.dart';
import 'package:learning_english_flutter_app/models/on_boarding_screen/widgets/bottom_sheet_item.dart';
import 'package:learning_english_flutter_app/models/on_boarding_screen/widgets/slide_tile.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<SlideModel> slides = [];
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    slides = getSlides();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: slides.length,
        onPageChanged: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        itemBuilder: (context, index) {
          return SlideTile(
            title: slides[index].title,
            description: slides[index].description,
            imageAssetPath: slides[index].imageAssetPath,
          );
        },
      ),
      bottomSheet: currentIndex != (slides.length - 1)
          ? BottomSheetItem(
              jumpToLastPage: jumpToLastPage,
              currentIndex: currentIndex,
              slides: slides,
              jumpToNextPage: jumpToNextPage,
            )
          : Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              color: Theme.of(context).primaryColor,
              child: const Text(
                'GET STARTED NOW',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12
                ),
              ),
            ),
    );
  }

  void jumpToLastPage() {
    pageController.animateToPage(
      slides.length - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  void jumpToNextPage() {
    pageController.animateToPage(
      currentIndex + 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }
}
