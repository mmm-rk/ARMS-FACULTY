import 'package:arms/Screens/Popups/ldp_newtopic.dart';
import 'package:flutter/material.dart';

class ClickedSave extends StatefulWidget {
  const ClickedSave({super.key});

  @override
  State<ClickedSave> createState() => _ClickedSaveState();
}

class _ClickedSaveState extends State<ClickedSave> {
  bool isSaveClicked = false;
  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isSaveClicked = true;
                  isButtonEnabled = true;
                });
              },
              style: ElevatedButton.styleFrom(
                primary:
                    Color.fromRGBO(65, 95, 76, 1), // Set the background color
              ),
              child: Row(
                children: [
                  Icon(Icons.save,
                      color: Colors.white), // Add icon before the text
                  SizedBox(width: 8), // Add space between icon and text
                  Text(
                    'SAVE',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: isButtonEnabled
                  ? () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AddNewTopic();
                          });
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                primary:
                    Color.fromRGBO(65, 95, 76, 1), // Set the background color
              ),
              child: Row(
                children: [
                  Icon(Icons.add,
                      color: Colors.white), // Add icon before the text
                  SizedBox(width: 8), // Add space between icon and text
                  Text(
                    'CREATE NEW TOPIC',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
