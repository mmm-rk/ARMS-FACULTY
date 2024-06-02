import 'package:arms/Screens/Class_dartfiles/assessment_page.dart';
import 'package:arms/Screens/LDP_dartfiles/ldp_page.dart';
import 'package:arms/Screens/Question_dartfiles/addquestion_details.dart';
import 'package:arms/Screens/Question_dartfiles/question_bank_page.dart';
import 'package:arms/Screens/Student_dartfiles/student_page.dart';
import 'package:arms/Screens/Widgets/side_navbar.dart';
import 'package:arms/Screens/home_page.dart';
import 'package:flutter/material.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({super.key});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
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
                  padding: EdgeInsets.fromLTRB(93, 0, 36, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: 2300,
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
                                              'Question Details',
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
                                  // Define your table container properties here
                                  child:
                                      AddQuestionDetails()), //Edit mo nalang sa pag display data
                            ),
                          ],
                        ),
                      ),
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
}
