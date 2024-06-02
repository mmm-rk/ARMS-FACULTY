// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

QuestionModel questionModelFromJson(String str) =>
    QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
  List<Question> questions;

  QuestionModel({
    required this.questions,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  int? id;
  int? facultyId;
  String? topic_name;
  String? questionText;
  String? options;
  String? correctAnswer;
  int? isApproved;
  DateTime? createdAt;
  DateTime? updatedAt;

  Question({
    required this.id,
    required this.facultyId,
    required this.topic_name,
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    required this.isApproved,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        facultyId: json["faculty_id"],
        topic_name: json["topic_name"],
        questionText: json["question_text"],
        options: json["options"],
        correctAnswer: json["correct_answer"],
        isApproved: json["is_approved"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "faculty_id": facultyId,
        "topic_name": topic_name,
        "question_text": questionText,
        "options": options,
        "correct_answer": correctAnswer,
        "is_approved": isApproved,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
