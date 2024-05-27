import 'package:arms/Screens/Class_dartfiles/class_page.dart';
import 'package:arms/Screens/LDP_dartfiles/ldp_page.dart';
import 'package:arms/Screens/Question_dartfiles/question_bank_page.dart';
import 'package:arms/Screens/Widgets/file_upload.dart';
import 'package:arms/Screens/Widgets/ldp_clicked_save.dart';
import 'package:arms/Screens/Widgets/side_navbar.dart';
import 'package:arms/Screens/home_page.dart';
import 'package:arms/Screens/settings_page.dart';
import 'package:flutter/material.dart';

class ClickedCreate extends StatefulWidget {
  const ClickedCreate({Key? key}) : super(key: key);

  @override
  _ClickedCreateState createState() => _ClickedCreateState();
}

class _ClickedCreateState extends State<ClickedCreate> {
  String _subjectTitle = 'Sample Subject';
  DateTime? _selectedDate;

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
            SizedBox(width: 5),
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                // Handle chat icon click
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
          Padding(
            padding: EdgeInsets.fromLTRB(160, 30, 50, 0),
            child: Container(
              width: 800,
              height: 500,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Text(
                          'Lesson Plan Details', // Align text on the left
                          style: TextStyle(
                            fontSize: 18, // Adjust the font size as needed
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(65, 95, 76, 1),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Subject Title',
                                labelStyle: TextStyle(fontSize: 16),
                                border: OutlineInputBorder(),
                              ),
                              style: TextStyle(fontSize: 16),
                              onChanged: (value) {
                                setState(() {
                                  _subjectTitle = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Date',
                                labelStyle: const TextStyle(fontSize: 16),
                                border: const OutlineInputBorder(),
                              ),
                              style: const TextStyle(fontSize: 16),
                              controller: TextEditingController(
                                text: _selectedDate != null
                                    ? '${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}'
                                    : '',
                              ),
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: _selectedDate ?? DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: ThemeData.light(),
                                      child: child!,
                                    );
                                  },
                                ).then((selectedDate) {
                                  if (selectedDate != null) {
                                    setState(() {
                                      _selectedDate = selectedDate;
                                    });
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: UploadExcelFile(),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ClickedSave(
                          subjectTitle: _subjectTitle, date: _selectedDate),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Divider(
                          color: Color.fromRGBO(65, 95, 76, 1),
                          height: 3,
                          thickness: 3,
                        ),
                      ),
                      SizedBox(height: 20), // Add some space below the Divider
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
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
                            return LdpPage();
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
                    icon: Icon(Icons.people),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const ClassPage();
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 18),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const SettingPage();
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
