import 'dart:convert';
import 'package:arms/Screens/home_page.dart';
import 'package:arms/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class AuthenticationController extends GetxController {
  final isLoading = false.obs;
  final token = ''.obs;
  final box = GetStorage();

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
        Get.to(() =>
            HomePage()); // Navigate to home page upon successful registration
      } else {
        var errorData = jsonDecode(response.body);
        debugPrint(errorData.toString());
        Get.snackbar(
          'Error',
          errorData['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
      Get.snackbar(
        'Error',
        'An error occurred. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> login({
    required String idNumber,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      var data = {
        'id_number': idNumber,
        'password': password,
      };

      var response = await http.post(
        Uri.parse('${url}login'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      isLoading.value = false;

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        debugPrint(responseData.toString());
        token.value = responseData['token'];
        box.write('token', responseData['token']);
        Get.offAll(() => HomePage());
      } else {
        var errorData = jsonDecode(response.body);
        debugPrint(errorData.toString());
        Get.snackbar(
          'Error',
          errorData['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
      Get.snackbar(
        'Error',
        'An error occurred. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
