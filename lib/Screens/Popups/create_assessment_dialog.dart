import 'package:flutter/material.dart';

class AssessmentDialog extends StatefulWidget {
  @override
  _AssessmentDialogState createState() => _AssessmentDialogState();
}

class _AssessmentDialogState extends State<AssessmentDialog> {
  final TextEditingController _assessmentNameController =
      TextEditingController();
  final TextEditingController _numberOfItemsController =
      TextEditingController();
  final TextEditingController _newTopicController = TextEditingController();

  String _selectedDifficulty = 'Easy';
  final List<String> _difficultyLevels = ['Easy', 'Medium', 'Hard'];
  List<String> _topics = [];

  void _generateAssessment() {
    final assessmentName = _assessmentNameController.text;
    final numberOfItems = int.tryParse(_numberOfItemsController.text) ?? 0;
    final difficulty = _selectedDifficulty;
    final topics = _topics;

    // Call the function to generate the assessment with these parameters
    print('Assessment Name: $assessmentName');
    print('Number of Items: $numberOfItems');
    print('Difficulty: $difficulty');
    print('Topics: $topics');
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 777,
        height: 380, // Adjusted height to accommodate chips input
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 777,
                height: 400,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 777,
                        height: 380,
                        decoration: ShapeDecoration(
                          color: Color(0xFFE1EDE5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 777,
                        height: 49.40,
                        decoration: ShapeDecoration(
                          color: Color(0xFF42604C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 36,
                      top: 14,
                      child: Text(
                        'ASSESSMENT DETAILS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 35,
                      top: 63,
                      child: Container(
                        width: 701,
                        height: 78,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Assessment Name',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: _assessmentNameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 35,
                      top: 146,
                      child: Container(
                        width: 150,
                        height: 78,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'No. of Items',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: _numberOfItemsController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              style: TextStyle(fontSize: 16),
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 215,
                      top: 146,
                      child: Container(
                        width: 231,
                        height: 78,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Level of Difficulty',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            DropdownButtonFormField<String>(
                              value: _selectedDifficulty,
                              items: _difficultyLevels.map((String difficulty) {
                                return DropdownMenuItem<String>(
                                  value: difficulty,
                                  child: Text(difficulty),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedDifficulty = newValue!;
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 35,
                      top: 230,
                      child: Container(
                        width: 701,
                        height:
                            100, // Increased height to accommodate chips input and prevent overflow
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Topics Covered',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: 701,
                              height:
                                  60, // Adjusted height to accommodate potential overflow
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 9),
                              decoration: ShapeDecoration(
                                color: Color(0xFFE9F3ED),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: Color(0xFF808080)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Wrap(
                                      spacing: 8,
                                      children: [
                                        ..._topics.map((tag) {
                                          return Chip(
                                            key: ValueKey(
                                                tag), // Ensure each chip has a unique key
                                            label: Text(
                                              tag,
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            onDeleted: () {
                                              setState(() {
                                                _topics.remove(tag);
                                              });
                                            },
                                          );
                                        }).toList(),
                                        // Input field for adding new chips
                                        Container(
                                          width:
                                              120, // Adjust the width as needed
                                          child: TextField(
                                            controller: _newTopicController,
                                            onSubmitted: (value) {
                                              if (value.isNotEmpty &&
                                                  !_topics.contains(value)) {
                                                setState(() {
                                                  _topics.add(
                                                      value); // Add the new topic to the list
                                                  _newTopicController
                                                      .clear(); // Clear the text field
                                                });
                                              }
                                            },
                                            style: TextStyle(
                                              fontSize:
                                                  15, // Adjust the font size as needed
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'Add Topic',
                                            ),
                                          ),
                                        ),
                                      ],
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
                      left: 303,
                      top: 320,
                      child: GestureDetector(
                        onTap: _generateAssessment,
                        child: Container(
                          width: 128,
                          height: 43,
                          decoration: ShapeDecoration(
                            color: Color(0xFF436850),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(2, 2),
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'GENERATE',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
