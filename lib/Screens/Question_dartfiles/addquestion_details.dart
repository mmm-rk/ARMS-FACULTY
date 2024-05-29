import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddQuestionDetails extends StatefulWidget {
  const AddQuestionDetails.AddQuestionDetails({Key? key}) : super(key: key);

  @override
  State<AddQuestionDetails> createState() => _AddQuestionDetailsState();
}

class _AddQuestionDetailsState extends State<AddQuestionDetails> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _newTagController = TextEditingController();
  final List<TextEditingController> _optionControllers =
      List.generate(4, (_) => TextEditingController());
  int _correctAnswerIndex = 0;
  String _selectedDifficulty = 'Easy';
  List<String> _tags = [];
  final List<String> _predefinedTags = ['Taxation'];

  Future<void> _saveQuestion() async {
    if (_formKey.currentState!.validate()) {
      final questionData = {
        'topic': _topicController.text,
        'questionText': _questionController.text,
        'options':
            _optionControllers.map((controller) => controller.text).toList(),
        'correctAnswerIndex': _correctAnswerIndex,
        'tags': _tags.toList(),
        'difficulty': _selectedDifficulty,
      };

      final response = await http.post(
        Uri.parse('http://your_api_endpoint_here/questions'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(questionData),
      );

      if (response.statusCode == 200) {
        // Successfully saved
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Question saved successfully')),
        );
      } else {
        // Error occurred
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save question')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: 2300,
      height: 620,
      child: Form(
        key: _formKey,
        child: Stack(
          children: [
            // Topic/Module Covered
            Positioned(
              left: 0,
              top: 0,
              child: Text(
                'Topic/Module Covered',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 38,
              child: Container(
                width: 500,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 9),
                decoration: ShapeDecoration(
                  color: Color(0xFFE9F3ED),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF808080)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Wrap(
                  spacing: 8,
                  children: [
                    ..._predefinedTags.map((tag) {
                      return Chip(
                        label: Text(
                          tag,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        onDeleted: () {
                          setState(() {
                            _predefinedTags.remove(tag);
                          });
                        },
                      );
                    }).toList(),
                    // Input field for adding new chips
                    Container(
                      width: 120, // Adjust the width as needed
                      child: TextField(
                        controller: _newTagController,
                        onSubmitted: (value) {
                          setState(() {
                            _predefinedTags
                                .add(value); // Add the new tag to the list
                            _newTagController.clear(); // Clear the text field
                          });
                        },
                        style: TextStyle(
                          fontSize: 15, // Adjust the font size as needed
                        ),
                        decoration: InputDecoration(
                          hintText: 'Add Tag',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Level of Difficulty
            Positioned(
              left: 520,
              top: 0,
              child: Text(
                'Level of Difficulty',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 520,
              top: 38,
              child: Container(
                width: 299,
                height: 50,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                decoration: ShapeDecoration(
                  color: Color(0xFFE9F3ED),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF808080)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  value: _selectedDifficulty,
                  decoration: InputDecoration.collapsed(hintText: ''),
                  items: <String>['Easy', 'Medium', 'Hard'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedDifficulty = newValue!;
                    });
                  },
                ),
              ),
            ),

            // Question
            Positioned(
              left: 0,
              top: 94,
              child: Container(
                width: 840,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 840,
                      height: 100,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 9),
                      decoration: ShapeDecoration(
                        color: Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1, color: Colors.black.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: TextFormField(
                        controller: _questionController,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        maxLines: 4,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          border: InputBorder.none,
                          hintText: 'Enter the question text here',
                          hintStyle: TextStyle(
                            color: Color(0xFF808080),
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Answer Options
            Positioned(
              left: 0,
              top: 230,
              child: Container(
                width: 2300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Answer Options',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    for (int i = 0; i < 4; i++)
                      Container(
                        width: 840,
                        height: 50,
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 9),
                        decoration: ShapeDecoration(
                          color: Color(0xFFFFFFFF),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1, color: Colors.black.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: TextFormField(
                          controller: _optionControllers[i],
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter answer option ${i + 1}',
                            hintStyle: TextStyle(
                              color: Color(0xFF808080),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // Correct Answer Selection
            Positioned(
              left: 0,
              top: 500,
              child: Container(
                width: 840,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Correct Answer',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 299,
                      height: 42,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 9),
                      decoration: ShapeDecoration(
                        color: Color(0xFFE9F3ED),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF808080)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: DropdownButtonFormField<int>(
                        isExpanded: true,
                        value: _correctAnswerIndex,
                        decoration: InputDecoration.collapsed(hintText: ''),
                        items: List.generate(
                            4,
                            (index) => DropdownMenuItem(
                                  value: index,
                                  child: Text(
                                    'Option ${index + 1}',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                )),
                        onChanged: (int? newValue) {
                          setState(() {
                            _correctAnswerIndex = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select the correct answer';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Save Button
            Positioned(
              left: 730,
              top: 540,
              child: ElevatedButton.icon(
                onPressed: _saveQuestion,
                icon: Icon(Icons.add, color: Colors.white),
                label: Text(
                  'CREATE',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(65, 95, 76, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
