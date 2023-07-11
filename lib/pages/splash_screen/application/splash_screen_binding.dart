import 'package:get/get.dart';
import 'package:quiz_questions/pages/splash_screen/application/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
  }
}