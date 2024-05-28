import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadExcelFile extends StatefulWidget {
  const UploadExcelFile({super.key});

  @override
  State<UploadExcelFile> createState() => _UploadExcelFileState();
}

class _UploadExcelFileState extends State<UploadExcelFile> {
  String? _filePath;

  Future<void> _pickExcelFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xls', 'xlsx'], // Allow only Excel files
      );

      if (result != null) {
        setState(() {
          _filePath = result.files.single.path!;
        });
        // You can now use _filePath to access the selected file
        print('File picked: $_filePath');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFDDF7E6),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          _pickExcelFile();
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Color(0xFFDDF7E6),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'UPLOAD FILES (Maximum of 1 File per Lesson Plan)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
