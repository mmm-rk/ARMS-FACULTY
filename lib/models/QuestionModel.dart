import 'dart:convert';

class QuestionModel {
  List<Question> questions;

  QuestionModel({
    required this.questions,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        questions: List<Question>.from((json["questions"] as List<dynamic>)
            .map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  int? id;
  int? facultyId;
  String? topicName;
  String? questionText;
  List<String>? options;
  String? correctAnswer;
  int? isApproved;
  DateTime? createdAt;
  DateTime? updatedAt;

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

  factory Question.fromJson(Map<String, dynamic> json) {
    // Handle options which can be either a map or a list
    var optionsData = json['options'];
    List<String> parsedOptions;

    if (optionsData is String) {
      // If options are JSON-encoded string
      optionsData = jsonDecode(optionsData);
    }

    if (optionsData is Map) {
      // If options is a map, convert it to a list of values
      parsedOptions = optionsData.values.map((e) => e.toString()).toList();
    } else if (optionsData is List) {
      // If options is already a list
      parsedOptions = List<String>.from(optionsData);
    } else {
      // Handle unexpected format
      parsedOptions = [];
    }

    return Question(
      id: json["id"],
      facultyId: json["faculty_id"],
      topicName: json["topic_name"],
      questionText: json["question_text"],
      options: parsedOptions,
      correctAnswer: json["correct_answer"],
      isApproved: json["is_approved"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "faculty_id": facultyId,
        "topic_name": topicName,
        "question_text": questionText,
        "options": jsonEncode(options), // Encode options as JSON string
        "correct_answer": correctAnswer,
        "is_approved": isApproved,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
