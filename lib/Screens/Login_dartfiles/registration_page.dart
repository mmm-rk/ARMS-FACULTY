import 'package:arms/controllers/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

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
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Background Image
          Container(color: Color.fromRGBO(208, 217, 211, 1)),
          // Registration Form
          Center(
            child: Column(
              children: [
                Container(
                  height: 211,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Registration',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF436850),
                        ),
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                          controller: _firstNameController,
                          label: 'First Name'),
                      SizedBox(height: 15),
                      _buildTextField(
                          controller: _middleNameController,
                          label: 'Middle Name'),
                      SizedBox(height: 15),
                      _buildTextField(
                          controller: _lastNameController, label: 'Last Name'),
                      SizedBox(height: 15),
                      _buildTextField(
                          controller: _idNumberController, label: 'ID Number'),
                      SizedBox(height: 15),
                      _buildTextField(
                          controller: _emailController, label: 'Email'),
                      SizedBox(height: 15),
                      _buildTextField(
                          controller: _phoneNumberController,
                          label: 'Phone Number'),
                      SizedBox(height: 15),
                      TextField(
                        controller: _birthdateController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Birthdate',
                          labelStyle:
                              TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () {
                              _selectDate(context);
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.black26,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.black26,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                        readOnly: true,
                      ),
                      SizedBox(height: 15),
                      _buildTextField(
                          controller: _genderController, label: 'Gender'),
                      SizedBox(height: 15),
                      _buildTextField(
                          controller: _addressController, label: 'Address'),
                      SizedBox(height: 25),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Obx(() {
                                return _authenticationController.isLoading.value
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                            top:
                                                50), // Adjust the top padding as needed
                                        child: CircularProgressIndicator(),
                                      )
                                    : SizedBox(
                                        height:
                                            86); // Hides the indicator when not loading
                              }),
                            ),
                            Center(
                              child: Container(
                                width: 400, // Fixed width of the container
                                height: 50, // Fixed height of the container
                                child: ElevatedButton(
                                  onPressed: _authenticationController
                                          .isLoading.value
                                      ? null
                                      : () async {
                                          await _authenticationController
                                              .register(
                                            first_name: _firstNameController
                                                .text
                                                .trim(),
                                            middle_name: _middleNameController
                                                .text
                                                .trim(),
                                            last_name:
                                                _lastNameController.text.trim(),
                                            id_number:
                                                _idNumberController.text.trim(),
                                            email: _emailController.text.trim(),
                                            phone_number: _phoneNumberController
                                                .text
                                                .trim(),
                                            birth_date: _birthdateController
                                                .text
                                                .trim(),
                                            gender:
                                                _genderController.text.trim(),
                                            address:
                                                _addressController.text.trim(),
                                          );
                                        },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromRGBO(67, 104, 80,
                                        1), // Change the background color here
                                  ),
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'Poppins',
                                      color: Color.fromRGBO(235, 235, 235, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Do you already have an Account?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: Text(
                              'Login Now!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.italic,
                                color: Color.fromRGBO(67, 104, 80, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller,
      required String label,
      bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),
        labelText: label,
        labelStyle: TextStyle(fontSize: 14),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.black26,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.black26,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      style: TextStyle(fontSize: 14),
    );
  }
}
