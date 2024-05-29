import 'package:flutter/material.dart';

class StudentTable extends StatefulWidget {
  const StudentTable({Key? key}) : super(key: key);

  @override
  State<StudentTable> createState() => _StudentTableState();
}

class _StudentTableState extends State<StudentTable> {
  List<Student> _studentList = []; // List to hold student data

  @override
  void initState() {
    super.initState();
    // Fetch student data from API
    _fetchStudentData();
  }

  Future<void> _fetchStudentData() async {
    // const String apiUrl =
    //     'https://example.com/api/students'; // Replace with your API URL

    // try {
    //   final response = await http.get(Uri.parse(apiUrl));

    //   if (response.statusCode == 200) {
    //     final List<dynamic> data = jsonDecode(response.body);
    //     setState(() {
    //       _studentList = data.map((json) => Student.fromJson(json)).toList();
    //     });
    //   } else {
    //     throw Exception('Failed to load student data');
    //   }
    // } catch (error) {
    //   // Handle error appropriately
    //   print('Error fetching student data: $error');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 850,
      height: 600,
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 20, // Adjust the spacing between columns
          columns: [
            DataColumn(
              label: Text(
                'FIRST NAME',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'MIDDLE NAME',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'LAST NAME',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'ID NUMBER',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'EMAIL',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'PHONE NUMBER',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'BIRTHDATE',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'GENDER',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'ADDRESS',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
          rows: _studentList.map((student) {
            return DataRow(
              cells: [
                DataCell(
                  Text(
                    student.firstName,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataCell(
                  Text(
                    student.middleName,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataCell(
                  Text(
                    student.lastName,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataCell(
                  Text(
                    student.idNumber,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataCell(
                  Text(
                    student.email,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataCell(
                  Text(
                    student.phoneNumber,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataCell(
                  Text(
                    student.birthdate,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataCell(
                  Text(
                    student.gender,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataCell(
                  Text(
                    student.address,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Student {
  final String firstName;
  final String middleName;
  final String lastName;
  final String idNumber;
  final String email;
  final String phoneNumber;
  final String birthdate;
  final String gender;
  final String address;

  Student({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.idNumber,
    required this.email,
    required this.phoneNumber,
    required this.birthdate,
    required this.gender,
    required this.address,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      firstName: json['firstName'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      idNumber: json['idNumber'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      birthdate: json['birthdate'],
      gender: json['gender'],
      address: json['address'],
    );
  }
}
