import 'package:arms/controllers/assessmentController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssessmentTable extends StatefulWidget {
  const AssessmentTable({Key? key}) : super(key: key);

  @override
  State<AssessmentTable> createState() => _AssessmentTableState();
}

class _AssessmentTableState extends State<AssessmentTable> {
  final AssessmentController assessmentController =
      Get.put(AssessmentController());
  int _selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    assessmentController.getAllAssessments();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (assessmentController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
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
              'DATE CREATED',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
        rows: List.generate(
          assessmentController.assessments.length,
          (index) {
            final assessment = assessmentController.assessments[index];
            return DataRow(
              selected: _selectedIndex == index,
              onSelectChanged: (selected) {
                setState(() {
                  _selectedIndex = selected != null && selected ? index : -1;
                });
              },
              cells: [
                DataCell(
                  Text(
                    assessment.name ?? '',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataCell(
                  Text(
                    assessment.createdAt.toString(),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            );
          },
        ).toList(),
      );
    });
  }
}
