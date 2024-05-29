import 'package:flutter/material.dart';

class AssessmentTable extends StatefulWidget {
  const AssessmentTable({Key? key}) : super(key: key);

  @override
  State<AssessmentTable> createState() => _AssessmentTableState();
}

class _AssessmentTableState extends State<AssessmentTable> {
  List<AssessmentData> _assessmentDataList = []; // List to hold assessment data

  @override
  void initState() {
    super.initState();
    // You can fetch assessment data from API here and update _assessmentDataList
    _fetchAssessmentData();
  }

  void _fetchAssessmentData() {
    // Simulated fetching of assessment data from API
    // This is where you would make your API call to get the assessment data
    // For demonstration, I'm adding sample data here
    setState(() {
      _assessmentDataList = [
        AssessmentData(
          assessmentName: 'Sample Assessment 1',
          creator: 'John Doe',
          dateCreated: '2024-05-27',
        ),
        AssessmentData(
          assessmentName: 'Sample Assessment 2',
          creator: 'Jane Smith',
          dateCreated: '2024-05-28',
        ),
        // Add more sample assessment data as needed
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
            'ASSESSMENT NAME',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'CREATED BY',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'DATE CREATED',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ],
      rows: _assessmentDataList.map((assessmentData) {
        return DataRow(
          cells: [
            DataCell(
              Text(
                assessmentData.assessmentName,
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {
                // Add action for tapping on assessment
              },
            ),
            DataCell(
              Text(
                assessmentData.creator,
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {
                // Add action for tapping on creator
              },
            ),
            DataCell(
              Text(
                assessmentData.dateCreated,
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {
                // Add action for tapping on date created
              },
            ),
          ],
        );
      }).toList(),
    );
  }
}

class AssessmentData {
  final String assessmentName;
  final String creator;
  final String dateCreated;

  AssessmentData({
    required this.assessmentName,
    required this.creator,
    required this.dateCreated,
  });
}
