import 'dart:convert';

AssessmentModel assessmentModelFromJson(String str) =>
    AssessmentModel.fromJson(json.decode(str));

String assessmentModelToJson(AssessmentModel data) =>
    json.encode(data.toJson());

class AssessmentModel {
  List<Assessment> assessments;

  AssessmentModel({
    required this.assessments,
  });

  factory AssessmentModel.fromJson(Map<String, dynamic> json) =>
      AssessmentModel(
        assessments: List<Assessment>.from(
            json["assessments"].map((x) => Assessment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "assessments": List<dynamic>.from(assessments.map((x) => x.toJson())),
      };
}

class Assessment {
  int id;
  int facultyId;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  List<Question> questions;

  Assessment({
    required this.id,
    required this.facultyId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.questions,
  });

  factory Assessment.fromJson(Map<String, dynamic> json) => Assessment(
        id: json["id"],
        facultyId: json["faculty_id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "faculty_id": facultyId,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  int id;
  int facultyId;
  String topicName;
  String questionText;
  String options;
  String correctAnswer;
  int isApproved;
  DateTime createdAt;
  DateTime updatedAt;

  Question({
    required this.id,
    required this.facultyId,
    required this.topicName,
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
        topicName: json["topic_name"],
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
        "topic_name": topicName,
        "question_text": questionText,
        "options": options,
        "correct_answer": correctAnswer,
        "is_approved": isApproved,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
