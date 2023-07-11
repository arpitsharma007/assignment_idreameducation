import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_questions/app_config/app_colors.dart';
import 'package:quiz_questions/app_config/app_font_size.dart';
import 'package:quiz_questions/app_config/strings.dart';
import 'package:quiz_questions/model/questionModel.dart';
import 'package:quiz_questions/pages/home_page/application/home_screen_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  HomePageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.appName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: FontSizes.size_20,
          ),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: FontSizes.spacer,
            right: FontSizes.spacer,
            top: FontSizes.spacer),
        child: Obx(() {
          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(controller.questionList[controller.currentQuestionNumber.value]
                .question.toString(),
              style: const TextStyle(
                fontSize: FontSizes.size_20,
              ),
            ),
            if(controller.questionList[controller.currentQuestionNumber.value]
                .options != null)
              ...controller.questionList[controller.currentQuestionNumber.value]
                  .options!.map((e) =>
                  RadioMenuButton(value: e,
                    groupValue: controller.groupValue.value,
                    onChanged: (e) {
                      controller.groupValue.value = e ?? "";
                      controller.checkAnswer(e);
                    },
                    child: Text(
                      e.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: FontSizes.size_16,
                      ),
                    ),)).toList(),
            // Correct widget
            if(controller.whetherAnswerCorrect.value == "true")
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: FontSizes.spacer * 2),
                    child: Container(
                      padding: const EdgeInsets.all(FontSizes.spacer * 3),
                      color: const Color(0xff90EE90),
                      child: Center(
                        child: Text(
                          Strings.correctAnswer,
                          style: const TextStyle(fontSize: FontSizes.size_20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Incorrect widget
            if(controller.whetherAnswerCorrect.value == "false")
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: FontSizes.spacer * 2),
                    child: Container(
                      padding: const EdgeInsets.all(FontSizes.spacer * 3),
                      color: const Color(0xffffcccb),
                      child: Center(
                        child: Text(
                          Strings.inCorrectAnswer,
                          style: const TextStyle(fontSize: FontSizes.size_20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: FontSizes.spacer * 2,
            ),
            Center(
              child: MaterialButton(
                  color: AppColors.primaryColor,
                  onPressed: () {
                    controller.nextQuestion();
                  },
                  child: Text(
                    Strings.next,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: FontSizes.size_16,
                    ),
                  )),
            ),
            const SizedBox(
              height: FontSizes.spacer * 2,
            ),
            Center(
              child: MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    controller.resetQuiz();
                  },
                  child: Text(
                    Strings.resetQuiz,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: FontSizes.size_14,
                    ),
                  )),
            ),
          ],
          );
        }),
      ),
    );
  }
}
