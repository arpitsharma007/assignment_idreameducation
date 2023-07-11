import 'package:get/get.dart';
import 'package:quiz_questions/app_config/app_routes.dart';
import 'package:quiz_questions/pages/home_page/application/home_screen_binding.dart';
import 'package:quiz_questions/pages/home_page/ui/home_screen_ui.dart';
import 'package:quiz_questions/pages/splash_screen/application/splash_screen_binding.dart';
import 'package:quiz_questions/pages/splash_screen/ui/splash_screen_page.dart';

class AppScreens {
  AppScreens._();

  static List<GetPage> appScreens = [
    //Simple GetPage
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    // GetPage with default transitions
    GetPage(
      name: AppRoutes.homePage,
      page: () => HomePage(),
      binding: HomePageBinding(),
    ),
  ];
}