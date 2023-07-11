import 'package:get/get.dart';
import 'package:quiz_questions/pages/home_page/application/home_screen_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}