import 'package:arms/constants/constants.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:arms/models/AssessmentModel.dart';

class AssessmentController extends GetxController {
  var isLoading = true.obs;
  var assessments = <Assessment>[].obs;
  final box = GetStorage();

  @override
  void onInit() {
    getAllAssessments();
    super.onInit();
  }

  void getAllAssessments() async {
    try {
      isLoading(true);

      var assessmentResult = await getAssessments();
      if (assessmentResult != null) {
        assessments.assignAll(assessmentResult);
      }
    } catch (e) {
      print("Error fetching assessments: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<List<Assessment>?> getAssessments() async {
    try {
      var response = await http.get(
        Uri.parse('${url}get-assessments'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        var assessmentModel = AssessmentModel.fromJson(jsonResponse);
        return assessmentModel.assessments;
      } else {
        print("Failed to load assessments: ${response.body}");
        return [];
      }
    } catch (e) {
      print("Error in getAssessments: $e");
      return [];
    }
  }

  Future addAssessment({
    required List<String> topics,
    required int questionCount,
    required String name,
  }) async {
    try {
      var data = {
        'topic_name': topics,
        'question_count': questionCount,
        'name': name,
      };

      var response = await http.post(
        Uri.parse('${url}generate-assessment'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        Get.snackbar(
          'Success',
          'Assessment added successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        print(json.decode(response.body));
      } else {
        var errorData = json.decode(response.body);
        var errorMessage = errorData['message'];
        var errorList = errorData['errors'];

        String errorText = 'Error: $errorMessage\n';
        for (var field in errorList.keys) {
          errorText += '- $field: ${errorList[field]?.join(', ')}\n';
        }

        Get.snackbar(
          'Error',
          errorText,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error in adding assessment');
      print(e.toString());
    }
  }
}
