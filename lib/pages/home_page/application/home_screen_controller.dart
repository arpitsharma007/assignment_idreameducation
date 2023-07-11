import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_questions/app_config/app_font_size.dart';
import 'package:quiz_questions/common_widget/common_widget.dart';
import 'package:quiz_questions/data.dart';
import 'package:quiz_questions/model/questionModel.dart';

class HomePageController extends GetxController {
  List abc = [1, 2, 4];
  RxString whetherAnswerCorrect = "".obs;
  RxString groupValue = "".obs;
  RxInt currentQuestionNumber = 0.obs;
  RxList<QuestionModel> questionList = <QuestionModel>[].obs;
  RxInt score = 0.obs;

  @override
  void onInit() {
    super.onInit();
    initializeQuestionList();
  }

  initializeQuestionList() {
    for (var question in questionListJson) {
      QuestionModel questionObj = QuestionModel.fromJson(question);
      questionList.add(questionObj);
      // print(questionObj.toJson());
    }
    // print(questionList.value);
  }

  resetQuiz() {
    currentQuestionNumber.value = 0;
    score.value = 0;
    whetherAnswerCorrect.value = "";
    groupValue.value = "";
  }

  nextQuestion() {
    print(currentQuestionNumber.value);
    print(questionList.length);
    if (currentQuestionNumber.value < questionList.length- 1) {
      // if(currentQuestionNumber.value < questionList.length ) {
      //
      // }
      currentQuestionNumber.value++;
      groupValue.value = "";
      whetherAnswerCorrect.value = "";
    } else {
      Get.dialog(
        customDialog(
          contentPadding: EdgeInsets.all(10),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Your Score is",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: FontSizes.size_20,
                ),
              ),
              const SizedBox(height: FontSizes.spacer * 2,),
              Text(
                "${score.value}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: FontSizes.size_20,
                ),
              ),
              const SizedBox(height: FontSizes.spacer * 2,),

            ],
          ),
        ),
      );
    }
  }

  checkAnswer(e) {
    if (questionList[currentQuestionNumber.value].correctAnswer == e) {
      whetherAnswerCorrect.value = "true";
      score.value++;
    } else {
      whetherAnswerCorrect.value = "false";
    }
  }
}
