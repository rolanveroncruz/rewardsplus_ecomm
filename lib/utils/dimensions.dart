import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height; //844 on iphone 12 pro
  static double screenWidth = Get.context!.width; // 375 on iphone 12 pro

  static const pageHeightFactor = 2.64;
  static const carouselHeightFactor = 3.84;
  static const carouselTextHeightFactor = 7.03;
  static double pageViewHeight = screenHeight / pageHeightFactor;
  static double pageViewContainerHeight = screenHeight / carouselHeightFactor;
  static double pageViewTextContainerHeight =
      screenHeight / carouselTextHeightFactor;

  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.75;

  static double width05 = screenWidth / 78.0;
  static double width10 = screenWidth / 39.0;
  static double width15 = screenWidth / 26;
  static double width20 = screenWidth / 18.75;
  static double width30 = screenWidth / 12.5;
  static double width45 = screenWidth / 8.33;

  static double font12 = screenHeight / 70.33;
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;

  //popular food
  static double popularFoodImgSize = screenHeight / 2.41;

  //bottom height
  static double bottomHeightBar = screenHeight / 7.03;
}
