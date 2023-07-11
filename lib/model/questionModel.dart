class QuestionModel {
  int? id;
  String? question;
  String? correctAnswer;
  List<String>? options;

  QuestionModel({this.id, this.question, this.correctAnswer, this.options});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['correct_answer'] = this.correctAnswer;
    data['options'] = this.options;
    return data;
  }
}