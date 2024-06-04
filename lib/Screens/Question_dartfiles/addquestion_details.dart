import 'package:arms/Screens/Question_dartfiles/question_bank_page.dart';
import 'package:arms/controllers/questionController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddQuestionDetails extends StatefulWidget {
  const AddQuestionDetails({Key? key}) : super(key: key);

  @override
  State<AddQuestionDetails> createState() => _AddQuestionDetailsState();
}

class _AddQuestionDetailsState extends State<AddQuestionDetails> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _questionController = TextEditingController();
  final List<TextEditingController> _optionControllers = [];
  final TextEditingController _answerController = TextEditingController();
  String _correctAnswerText = '';
  String _selectedTopic = 'Financial Accounting';

  final QuestionController questionController = Get.find<QuestionController>();

  @override
  void initState() {
    super.initState();
    // Initialize with four option controllers
    for (int i = 0; i < 4; i++) {
      _optionControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    _questionController.dispose();
    _answerController.dispose();
    for (var controller in _optionControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addOption() {
    setState(() {
      _optionControllers.add(TextEditingController());
    });
  }

  void _removeOption(int index) {
    setState(() {
      if (_optionControllers.length > 1) {
        _optionControllers[index].dispose();
        _optionControllers.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: 1250,
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
                width: 860,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 9),
                decoration: ShapeDecoration(
                  color: Color(0xFFE9F3ED),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF808080)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedTopic,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedTopic = newValue!;
                      });
                    },
                    items: <String>[
                      'Financial Accounting',
                      'Managerial Accounting',
                      'Taxation',
                      'Auditing'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),

            // Correct Answer Selection
            Positioned(
              left: 900,
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
                    const SizedBox(height: 20),
                    Container(
                      width: 299,
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: ShapeDecoration(
                        color: Color(0xFFE9F3ED),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF808080)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: TextField(
                        controller: _answerController,
                        decoration: InputDecoration(
                          hintText: 'Enter Correct Answer',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 9),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _correctAnswerText = value;
                          });
                        },
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Question
            Positioned(
              left: 0,
              top: 94,
              child: Container(
                width: 1200,
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
                      width: 1200,
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
                width: 1200,
                height: 310,
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
                    Expanded(
                      child: ListView.builder(
                        itemCount: _optionControllers.length,
                        itemBuilder: (context, i) {
                          return Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: 1200,
                                  height: 50,
                                  margin: const EdgeInsets.only(bottom: 8),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 9),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFFFFFFF),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1,
                                          color: Colors.black.withOpacity(0.5)),
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
                              ),
                              IconButton(
                                icon: Icon(Icons.remove_circle,
                                    color: Colors.red),
                                onPressed: () => _removeOption(i),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: _addOption,
                          icon: Icon(Icons.add_circle,
                              color: Color.fromRGBO(65, 95, 76, 1)),
                          label: Text('Add Option',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(65, 95, 76, 1))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Cancel and Create Buttons
            Positioned(
              left: 500,
              top: 540,
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const QuestionPage();
                          },
                        ),
                      );
                    },
                    icon: Icon(Icons.backspace_rounded, color: Colors.white),
                    label: Text(
                      'CANCEL',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(197, 55, 55, 1),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: () async {
                      // Create a map for options with keys A, B, C, D...
                      Map<String, String> options = {};
                      String optionLabels = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

                      for (int i = 0; i < _optionControllers.length; i++) {
                        String optionText = _optionControllers[i].text.trim();
                        if (optionText.isNotEmpty) {
                          options[optionLabels[i]] = optionText;
                        }
                      }

                      if (options.isNotEmpty) {
                        // Check if options list is not empty
                        await questionController.addQuestion(
                          topicName: _selectedTopic,
                          questionText: _questionController.text.trim(),
                          options: options,
                          correctAnswer: _correctAnswerText,
                        );
                        questionController.getQuestions();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const QuestionPage();
                            },
                          ),
                        );
                      } else {
                        // Handle case where options list is empty
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text('Please enter at least one option.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
