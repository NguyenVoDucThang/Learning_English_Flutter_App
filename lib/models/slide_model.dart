class SlideModel {
  String imageAssetPath;
  String title;
  String description;

  SlideModel({
    required this.imageAssetPath,
    required this.title,
    required this.description,
  });

  void setImageAssetPath(String imageAssetPath) {
    imageAssetPath = this.imageAssetPath;
  }

  void setTitle(String title) {
    title = this.title;
  }

  void setDescription(String description) {
    description = this.description;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDescription() {
    return description;
  }
}

List<SlideModel> getSlides() {
  List<SlideModel> slides = [
    SlideModel(
        title: 'Connect To The World',
        description:
            'Do you know that English is the \nmost popular language in the world?',
        imageAssetPath: 'assets/images/first_boarding.png'),
    SlideModel(
        title: 'Archive Your Goal',
        description:
            'Our application will help you learn \nEnglish in an uncomplicated way.',
        imageAssetPath: 'assets/images/second_boarding.png'),
    SlideModel(
        title: 'Interactive Learning',
        description: 'Even the greatest was once a beginner.\n Don\'t be afraid to take that first step.',
        imageAssetPath: 'assets/images/third_boarding.png'),
  ];

  return slides;
}
