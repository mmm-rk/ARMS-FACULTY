import 'package:arms/Screens/Login_dartfiles/registration_page.dart';
import 'package:arms/controllers/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Container(
          height: 700, // Fixed height
          width: 1100, // Fixed width
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150, // Adjust the height of your logo container
                width: 150, // Adjust the width of your logo container
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/logo.png'), // Adjust the image path
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.fromLTRB(200, 20, 200, 0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(208, 217, 211, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'LOGIN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(67, 104, 80, 1),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: _idNumberController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'ID Number',
                        labelStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 0, 0, 0.473)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black26,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black26,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(0, 0, 0, 0.473),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black26,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black26,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.italic,
                            color: Color.fromRGBO(67, 104, 80, 1),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Obx(() {
                        return _authenticationController.isLoading.value
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ElevatedButton(
                                onPressed: () async {
                                  await _authenticationController.login(
                                    idNumber: _idNumberController.text,
                                    password: _passwordController.text,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.black,
                                  elevation: 10,
                                  backgroundColor:
                                      const Color.fromRGBO(67, 104, 80, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(90, 25, 90, 10),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(235, 235, 235, 1),
                                    ),
                                  ),
                                ),
                              );
                      }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t Have an account?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                            );
                          },
                          child: Text(
                            ' Register Now!',
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
                    SizedBox(height: 20)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
