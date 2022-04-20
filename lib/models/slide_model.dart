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
        title: 'World',
        description:
            'Do you know that English is the most popular language in the world?',
        imageAssetPath: 'assets/images/world.png'),
    SlideModel(
        title: 'Learn',
        description:
            'Our application will help you learn English in an uncomplicated way',
        imageAssetPath: 'assets/images/learning.png'),
    SlideModel(
        title: 'Start',
        description: 'Even the greatest was once a beginner.\n Don\'t be afraid to take that first step.',
        imageAssetPath: 'assets/images/start.png'),
  ];

  return slides;
}
