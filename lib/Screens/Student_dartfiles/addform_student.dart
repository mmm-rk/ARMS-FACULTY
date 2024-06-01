import 'package:arms/Screens/Class_dartfiles/assessment_page.dart';
import 'package:arms/Screens/LDP_dartfiles/ldp_page.dart';
import 'package:arms/Screens/Question_dartfiles/question_bank_page.dart';
import 'package:arms/Screens/Student_dartfiles/student_page.dart';
import 'package:arms/Screens/Widgets/side_navbar.dart';
import 'package:arms/Screens/home_page.dart';
import 'package:arms/controllers/studentController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String? _selectedGender; // Variable to hold selected gender

  final StudentController _studentController = Get.find<StudentController>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            textTheme: TextTheme(
              bodyLarge: TextStyle(fontSize: 16), // Adjust the font size here
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _birthdateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(208, 217, 211, 1),
        title: Row(
          children: [
            Text(
              'ARMS - Faculty Workspace',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Handle notification icon click
              },
            ),
            SizedBox(width: 13),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/userpic.png'),
              radius: 20,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(100, 0, 36, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: 2300, // Adjusted width
                        height: 700,
                        child: Stack(
                          children: [
                            Positioned(
                              child: Container(
                                width: 2300,
                                height: 700,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(208, 217, 211, 1),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(2, 2),
                                      spreadRadius: 2,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              child: Container(
                                width: 2300,
                                height: 54,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 2300,
                                        height: 54,
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(65, 95, 76, 1)),
                                      ),
                                    ),
                                    Positioned(
                                      left: 21,
                                      top: 11,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.article_outlined,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Student Information',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 54,
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                width: 1200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildTextField(
                                        controller: _firstNameController,
                                        label: 'First Name'),
                                    SizedBox(height: 10),
                                    _buildTextField(
                                        controller: _middleNameController,
                                        label: 'Middle Name'),
                                    SizedBox(height: 10),
                                    _buildTextField(
                                        controller: _lastNameController,
                                        label: 'Last Name'),
                                    SizedBox(height: 10),
                                    _buildTextField(
                                        controller: _idNumberController,
                                        label: 'ID Number'),
                                    SizedBox(height: 10),
                                    _buildTextField(
                                        controller: _emailController,
                                        label: 'Email'),
                                    SizedBox(height: 10),
                                    _buildTextField(
                                        controller: _phoneNumberController,
                                        label: 'Phone Number'),
                                    SizedBox(height: 10),
                                    TextField(
                                      controller: _birthdateController,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelText: 'Birthdate',
                                        labelStyle: TextStyle(fontSize: 16),
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.calendar_today),
                                          onPressed: () {
                                            _selectDate(context);
                                          },
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black26,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black26,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                      readOnly: true,
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0.0),
                                      child: Container(
                                        height: 50,
                                        child: DropdownButtonFormField<String>(
                                          value: _selectedGender,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _selectedGender = newValue;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            labelText: 'Gender',
                                            labelStyle: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Poppins'),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.black26,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.black26,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          items: <String>['Male', 'Female']
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                  fontSize:
                                                      16, // Reduced font size
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    _buildTextField(
                                        controller: _addressController,
                                        label: 'Address'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () async {
                          await _studentController.addStudent(
                            firstName: _firstNameController.text.trim(),
                            middleName: _middleNameController.text.trim(),
                            lastName: _lastNameController.text.trim(),
                            idNumber: _idNumberController.text.trim(),
                            email: _emailController.text.trim(),
                            phoneNumber: _phoneNumberController.text.trim(),
                            birthDate: _birthdateController.text.trim(),
                            gender: _selectedGender ?? '',
                            address: _addressController.text.trim(),
                          );
                          _studentController.getAllStudents();
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const StudentPage();
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(
                              65, 95, 76, 1), // Set the background color
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.person_add_alt,
                                color:
                                    Colors.white), // Add icon before the text
                            SizedBox(
                                width: 8), // Add space between icon and text
                            Text(
                              'ADD STUDENT',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Container(
              color: Color.fromRGBO(208, 217, 211, 1),
              width: 60,
            ),
          ),
          Positioned(
            top: 30,
            bottom: 0,
            left: 0,
            child: Container(
              color: Colors.transparent,
              width: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.home_rounded),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return HomePage();
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 18),
                  IconButton(
                    icon: Icon(Icons.book),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const LdpPage();
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 18),
                  IconButton(
                    icon: Icon(Icons.account_balance_wallet_rounded),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const QuestionPage();
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 18),
                  IconButton(
                    icon: Icon(Icons.credit_score_rounded),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const AssessmentPage();
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 18),
                  IconButton(
                    icon: Icon(Icons.supervised_user_circle_rounded),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const StudentPage();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: SideNavBar(),
    );
  }

  // Helper method to build TextFields with borders
  Widget _buildTextField(
      {required TextEditingController controller, required String label}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        labelStyle: TextStyle(fontSize: 16, color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black26,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black26,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      style: TextStyle(fontSize: 16, color: Colors.black),
    );
  }
}
