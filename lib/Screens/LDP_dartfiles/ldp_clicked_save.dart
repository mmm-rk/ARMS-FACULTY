import 'package:arms/Screens/LDP_dartfiles/expansion_panel.dart';
import 'package:arms/Screens/Popups/ldp_newtopic.dart';
import 'package:flutter/material.dart';

class ClickedSave extends StatefulWidget {
  final String subjectTitle;
  final DateTime? date;

  const ClickedSave(
      {super.key, required this.subjectTitle, required this.date});

  @override
  State<ClickedSave> createState() => _ClickedSaveState();
}

class _ClickedSaveState extends State<ClickedSave> {
  bool isSaveClicked = false;
  bool isButtonEnabled = false;
  bool isExpansionVisible = false;

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
                  print(
                      "Subject Title: ${widget.subjectTitle}"); // VALUE CHECKER
                  print("Date: ${widget.date}");
                  isButtonEnabled = true;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
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
                          return NewTopicPopup(onConfirm: () {
                            setState(() {
                              isExpansionVisible = true; // Set visibility flag
                            });
                          });
                        },
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor:
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
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Divider(
            color: Color.fromRGBO(65, 95, 76, 1),
            height: 3,
            thickness: 3,
          ),
        ),
        if (isExpansionVisible) // Only show ExpansionPanels if flag is true
          Container(
            width: 800, // Set the desired width
            height: 450, // Set the desired height
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ExpansionPanels(),
          ),
      ],
    );
  }
}
