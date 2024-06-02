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

  void onInit() {
    getAllQuestions();
    super.onInit();
  }

  void getAllQuestions() async {
    try {
      isLoading(true);

      // Fetch questions from the API
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

  Future getQuestions() async {
    try {
      var response = await http.get(
        Uri.parse('${url}questions'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );

      if (response.statusCode == 200) {
        var questionsData = json.decode(response.body)['questions'] as List;
        return questionsData.map((e) => Question.fromJson(e)).toList();
      } else {
        print("Failed to load questions: ${response.body}");
        return [];
      }
    } catch (e) {
      print("Error in getQuestions: $e");
      return [];
    }
  }

  //Add a new Question
  Future addQuestion({
    required String topic_name,
    required String questionText,
    required String options,
    required String correctAnswer,
  }) async {
    try {
      var data = {
        'topic_name': topic_name,
        'question_text': questionText,
        'options': options,
        'correct_answer': correctAnswer
      };

      var response = await http.post(Uri.parse('${url}questionadd'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read('token')}',
          },
          body: data);

      if (response.statusCode == 200) {
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
