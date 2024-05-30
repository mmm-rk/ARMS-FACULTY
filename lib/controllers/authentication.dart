import 'dart:convert';
import 'package:arms/Screens/home_page.dart';
import 'package:arms/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthenticationController extends GetxController {
  final isLoading = false.obs;

  Future<void> register({
    required String first_name,
    required String middle_name,
    required String last_name,
    required String id_number,
    required String email,
    required String phone_number,
    required String birth_date,
    required String gender,
    required String address,
  }) async {
    try {
      isLoading.value = true;

      var data = {
        'first_name': first_name,
        'middle_name': middle_name,
        'last_name': last_name,
        'id_number': id_number,
        'email': email,
        'phone_number': phone_number,
        'birth_date': birth_date,
        'gender': gender,
        'address': address,
      };

      var response = await http.post(
        Uri.parse(url + 'faculty-register'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      isLoading.value = false;

      if (response.statusCode == 201) {
        var responseData = jsonDecode(response.body);
        debugPrint(responseData.toString());
      } else {
        var errorData = jsonDecode(response.body);
        debugPrint(errorData.toString());
        //Get.snackbar('Error', errorData['message'] ?? 'Registration failed');
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
      //Get.snackbar('Error', 'An error occurred. Please try again.');
    }
  }
}
