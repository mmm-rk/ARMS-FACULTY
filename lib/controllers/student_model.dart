import 'dart:convert';
import 'package:arms/constants/constants.dart';
import 'package:arms/models/StudentModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class StudentController extends GetxController {
  var isLoading = true.obs;
  var students = <Student>[].obs;
  final box = GetStorage();

  @override
  void onInit() {
    getAllStudents();
    super.onInit();
  }

  void getAllStudents() async {
    try {
      isLoading(true);

      // Fetch students from the API
      var studentsResult = await getStudents();
      if (studentsResult != null) {
        students.assignAll(studentsResult);
      }
    } catch (e) {
      print("Error fetching students: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<List<Student>?> getStudents() async {
    try {
      var response = await http.get(
        Uri.parse('${url}students'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );

      if (response.statusCode == 200) {
        var studentsData = json.decode(response.body)['students'] as List;
        return studentsData.map((e) => Student.fromJson(e)).toList();
      } else {
        print("Failed to load students: ${response.body}");
        return [];
      }
    } catch (e) {
      print("Error in getStudents: $e");
      return [];
    }
  }
}
