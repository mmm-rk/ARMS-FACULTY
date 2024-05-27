import 'package:flutter/material.dart';

class TopicTable extends StatefulWidget {
  const TopicTable({super.key});

  @override
  State<TopicTable> createState() => _TopicTableState();
}

class _TopicTableState extends State<TopicTable> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 200, // Adjust the spacing between columns
      columns: [
        DataColumn(
            label: Text('MODULE NO.',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('MATERIALS',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
      ],
      rows: [
        DataRow(cells: [
          DataCell(
              Text('1 - TAXATION OVERVIEW', style: TextStyle(fontSize: 14))),
          DataCell(Text('SAMPLE MATERIALS', style: TextStyle(fontSize: 14))),
        ]),
        DataRow(cells: [
          DataCell(
              Text('1 - TAXATION OVERVIEW', style: TextStyle(fontSize: 14))),
          DataCell(Text('SAMPLE MATERIALS', style: TextStyle(fontSize: 14))),
        ]),
        // Add more DataRow widgets as needed
      ],
    );
  }
}
