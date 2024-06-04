import 'dart:convert';
import 'package:arms/constants/constants.dart';
import 'package:arms/models/QuestionModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class QuestionController extends GetxController {
  var isLoading = true.obs;
  var questions = <Question>[].obs;
  final box = GetStorage();

  @override
  void onInit() {
    getAllQuestions();
    super.onInit();
  }

  void getAllQuestions() async {
    try {
      isLoading(true);

      var questionsResult = await getQuestions();
      if (questionsResult != null) {
        questions.assignAll(questionsResult);
      }
    } catch (e) {
      print("Error fetching questions: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<List<Question>?> getQuestions() async {
    try {
      var response = await http.get(
        Uri.parse('${url}questions'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        var questionModel = QuestionModel.fromJson(jsonResponse);
        return questionModel.questions;
      } else {
        print("Failed to load questions: ${response.body}");
        return [];
      }
    } catch (e) {
      print("Error in getQuestions: $e");
      return [];
    }
  }

  Future addQuestion({
    required String topicName,
    required String questionText,
    required Map<String, String> options,
    required String correctAnswer,
  }) async {
    try {
      var data = {
        'topic_name': topicName,
        'question_text': questionText,
        'options': options, // Directly pass the options map
        'correct_answer': correctAnswer,
      };

      var response = await http.post(
        Uri.parse('${url}questionadd'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
          'Content-Type': 'application/json', // Ensure content type is JSON
        },
        body: jsonEncode(data), // Encode the entire data as JSON
      );

      if (response.statusCode == 201) {
        Get.snackbar(
          'Success',
          'Question added successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        print(json.decode(response.body));
      } else {
        Get.snackbar(
          'Error',
          'Failed to add question',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print(json.decode(response.body));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
