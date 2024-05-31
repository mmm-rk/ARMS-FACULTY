import 'package:arms/controllers/studentController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentTable extends StatelessWidget {
  final StudentController studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1200,
      height: 600,
      padding: EdgeInsets.all(16.0),
      child: Obx(() {
        if (studentController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 90,
            columns: [
              DataColumn(
                label: Text(
                  'FULL NAME',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'ID NUMBER',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'EMAIL',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'PHONE NUMBER',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'BIRTHDATE',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'GENDER',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'ADDRESS',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
            rows: studentController.students.map((student) {
              return DataRow(
                cells: [
                  DataCell(
                    Text(
                      '${student.firstName ?? ''} ${student.middleName ?? ''} ${student.lastName ?? ''}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      student.idNumber ?? '',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      student.email ?? '',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      student.phoneNumber ?? '',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      student.birthDate != null
                          ? '${student.birthDate!.year}-${student.birthDate!.month.toString().padLeft(2, '0')}-${student.birthDate!.day.toString().padLeft(2, '0')}'
                          : '',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      student.gender ?? '',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      student.address ?? '',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
