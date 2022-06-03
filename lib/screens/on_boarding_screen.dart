import 'package:flutter/material.dart';
import 'package:learning_english_flutter_app/models/slide_model.dart';
import 'package:learning_english_flutter_app/screens/welcome_screen.dart';
import 'package:learning_english_flutter_app/widgets/on_boarding_widget/bottom_sheet_item.dart';
import 'package:learning_english_flutter_app/widgets/on_boarding_widget/rounded_button.dart';
import 'package:learning_english_flutter_app/widgets/on_boarding_widget/slide_tile.dart';

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
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: pageController,
        itemCount: slides.length,
        onPageChanged: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        itemBuilder: (context, index) {
          if (index != 2) {
            return SlideTile(
              title: slides[index].title,
              description: slides[index].description,
              imageAssetPath: slides[index].imageAssetPath,
            );
          } else {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                SlideTile(
                  title: slides[index].title,
                  description: slides[index].description,
                  imageAssetPath: slides[index].imageAssetPath,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                RoundedButton(
                  text: 'Get Started Now',
                  backgroundColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, WelcomeScreen.routeName);
                  },
                )
              ],
            );
          }
        },
      ),
      bottomSheet: BottomSheetItem(
              jumpToLastPage: jumpToLastPage,
              currentIndex: currentIndex,
              slides: slides,
              jumpToNextPage: jumpToNextPage,
              jumpToPreviousPage: jumpPreviousPage,
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

  void jumpPreviousPage() {
    pageController.animateToPage(
      currentIndex == 0 ? currentIndex : currentIndex - 1,
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
