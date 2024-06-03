import 'package:arms/controllers/questionController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionTable extends StatefulWidget {
  final QuestionController questionController = Get.put(QuestionController());

  @override
  State<QuestionTable> createState() => _QuestionTableState();
}

class _QuestionTableState extends State<QuestionTable> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1230,
      height: 750,
      padding: EdgeInsets.all(16.0),
      child: Obx(() {
        if (widget.questionController.isLoading.value) {
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
                  widget.questionController.questions.length,
                  (index) {
                    final question = widget.questionController.questions[index];
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
                            'LOREM IPSUM', //question.questionText ?? ''
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            'LOREM IPSUM', //question.dateAdded
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            'LOREM IPSUM', //question.approvalStatus
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
