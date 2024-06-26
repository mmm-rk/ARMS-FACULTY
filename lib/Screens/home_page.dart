import 'package:arms/Screens/Class_dartfiles/assessment_page.dart';
import 'package:arms/Screens/LDP_dartfiles/ldp_page.dart';
import 'package:arms/Screens/Question_dartfiles/question_bank_page.dart';
import 'package:arms/Screens/Student_dartfiles/student_page.dart';
import 'package:arms/Screens/Widgets/side_navbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              child: Text('HOME PAGE'), // Add your main content here
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
                      onPressed: () {},
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
        drawer: const SideNavBar());
  }
}
