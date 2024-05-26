import 'package:arms/Screens/LDP_dartfiles/ldp_page.dart';
import 'package:arms/Screens/class_page.dart';
import 'package:arms/Screens/home_page.dart';
import 'package:arms/Screens/question_bank.dart';
import 'package:arms/Screens/setting.dart';
import 'package:flutter/material.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 18), // Add padding to the left
            height: 100, // Adjust the height as needed
            decoration: BoxDecoration(
              color: Color.fromRGBO(208, 217, 211, 1),
            ),
            child: Center(
              child: Text(
                'Acccountancy Review Management System',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_rounded), // Add the home icon here
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const HomePage();
                  },
                ),
              );
            },
          ),
          SizedBox(height: 18),
          ListTile(
            leading: Icon(Icons.book), // Add the home icon here
            title: Text(
              'Learning Development Plan',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
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
          ListTile(
            leading: Icon(
                Icons.account_balance_wallet_rounded), // Add the home icon here
            title: Text(
              'Question bank',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
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
          ListTile(
            leading: Icon(Icons.people), // Add the home icon here
            title: Text(
              'Class',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
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
          ListTile(
            leading: Icon(Icons.settings), // Add the home icon here
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
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
    );
  }
}
