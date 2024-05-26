import 'package:flutter/material.dart';

class LdpTable extends StatefulWidget {
  const LdpTable({Key? key}) : super(key: key);

  @override
  _LdpTableState createState() => _LdpTableState();
}

class _LdpTableState extends State<LdpTable> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 250, // Adjust the spacing between columns
      columns: [
        DataColumn(
            label: Text('Name',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('Creator',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('Date',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('Lesson 1', style: TextStyle(fontSize: 14))),
          DataCell(Text('John Doe', style: TextStyle(fontSize: 14))),
          DataCell(Text('2024-05-26', style: TextStyle(fontSize: 14))),
        ]),
        DataRow(cells: [
          DataCell(Text('Lesson 2', style: TextStyle(fontSize: 14))),
          DataCell(Text('Jane Smith', style: TextStyle(fontSize: 14))),
          DataCell(Text('2024-05-27', style: TextStyle(fontSize: 14))),
        ]),
        // Add more DataRow widgets as needed
      ],
    );
  }
}
