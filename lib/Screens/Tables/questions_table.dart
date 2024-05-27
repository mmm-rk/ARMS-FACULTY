import 'package:flutter/material.dart';

class QuestionTable extends StatefulWidget {
  const QuestionTable({super.key});

  @override
  State<QuestionTable> createState() => _QuestionTableState();
}

class _QuestionTableState extends State<QuestionTable> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 200, // Adjust the spacing between columns
      columns: [
        DataColumn(
            label: Text('QUESTION',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('DATE ADDED',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('APPROVAL STATUS',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('Is this a Sample Question?',
              style: TextStyle(fontSize: 14))),
          DataCell(Text('2024-05-27', style: TextStyle(fontSize: 14))),
          DataCell(Text('PENDING', style: TextStyle(fontSize: 14))),
        ]),
        DataRow(cells: [
          DataCell(Text('Is this a Sample Question?',
              style: TextStyle(fontSize: 14))),
          DataCell(Text('2024-05-27', style: TextStyle(fontSize: 14))),
          DataCell(Text('PENDING', style: TextStyle(fontSize: 14))),
        ]),
        // Add more DataRow widgets as needed
      ],
    );
  }
}
