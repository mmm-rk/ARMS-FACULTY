import 'package:arms/controllers/questionController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionTable extends StatefulWidget {
  @override
  _QuestionTableState createState() => _QuestionTableState();
}

class _QuestionTableState extends State<QuestionTable> {
  final QuestionController _questionController = Get.put(QuestionController());
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1230,
      height: 750,
      padding: EdgeInsets.all(16.0),
      child: Obx(() {
        if (_questionController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView(
          scrollDirection: Axis.vertical,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 420,
                columns: [
                  DataColumn(
                    label: Text(
                      'QUESTION',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'DATE ADDED',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'APPROVAL STATUS',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                rows: List.generate(
                  _questionController.questions.length,
                  (index) {
                    final question = _questionController.questions[index];
                    return DataRow(
                      selected: _selectedIndex == index,
                      onSelectChanged: (selected) {
                        setState(() {
                          _selectedIndex =
                              selected != null ? (selected ? index : -1) : -1;
                        });
                      },
                      cells: [
                        DataCell(
                          Text(
                            question.questionText ?? '',
                            style: TextStyle(fontSize: 14),
                          ),
                          onTap: () {},
                        ),
                        DataCell(
                          Text(
                            question.createdAt.toString(),
                            style: TextStyle(fontSize: 14),
                          ),
                          onTap: () {},
                        ),
                        DataCell(
                          Text(
                            question.isApproved == 1 ? 'Approved' : 'Pending',
                            style: TextStyle(fontSize: 14),
                          ),
                          onTap: () {},
                        ),
                      ],
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        );
      }),
    );
  }
}
