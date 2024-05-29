import 'package:flutter/material.dart';

class QuestionTable extends StatefulWidget {
  const QuestionTable({Key? key}) : super(key: key);

  @override
  State<QuestionTable> createState() => _QuestionTableState();
}

class _QuestionTableState extends State<QuestionTable> {
  List<QuestionData> _questionDataList = []; // List to hold question data

  @override
  void initState() {
    super.initState();
    // You can fetch question data from API here and update _questionDataList
    _fetchQuestionData();
  }

  void _fetchQuestionData() {
    // Simulated fetching of question data from API
    // This is where you would make your API call to get the question data
    // For demonstration, I'm adding sample data here
    setState(() {
      _questionDataList = [
        QuestionData(
          question: 'Is this a Sample Question?',
          dateAdded: '2024-05-27',
          approvalStatus: 'PENDING',
        ),
        QuestionData(
          question: 'Is this another Sample Question?',
          dateAdded: '2024-05-28',
          approvalStatus: 'APPROVED',
        ),
        // Add more sample question data as needed
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 200, // Adjust the spacing between columns
      columns: [
        DataColumn(
          label: Text(
            'QUESTION',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'DATE ADDED',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'APPROVAL STATUS',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ],
      rows: _questionDataList.map((questionData) {
        return DataRow(
          cells: [
            DataCell(
              Text(
                questionData.question,
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {},
            ),
            DataCell(
              Text(
                questionData.dateAdded,
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {},
            ),
            DataCell(
              Text(
                questionData.approvalStatus,
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {},
            ),
          ],
        );
      }).toList(),
    );
  }
}

class QuestionData {
  final String question;
  final String dateAdded;
  final String approvalStatus;

  QuestionData({
    required this.question,
    required this.dateAdded,
    required this.approvalStatus,
  });

  String get topic => '';

  String get questionText => '';

  get options => '';

  int get correctAnswerIndex => 0;

  Iterable get tags => [];

  String get difficulty => '';
}
