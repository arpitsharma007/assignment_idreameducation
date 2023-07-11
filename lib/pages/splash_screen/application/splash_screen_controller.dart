import 'package:get/get.dart';
import 'package:quiz_questions/app_config/app_routes.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAndToNamed(AppRoutes.homePage);
    });
  }
}