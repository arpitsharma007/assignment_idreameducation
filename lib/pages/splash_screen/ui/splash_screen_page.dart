import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_questions/app_config/app_font_size.dart';
import 'package:quiz_questions/app_config/strings.dart';
import 'package:quiz_questions/pages/splash_screen/application/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  SplashScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            Strings.appName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: FontSizes.size_80,
          ),
        ),
      ),
    );
  }
}
