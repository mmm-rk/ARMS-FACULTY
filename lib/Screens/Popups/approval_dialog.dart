import 'package:flutter/material.dart';

class ApprovalPopup extends StatelessWidget {
  const ApprovalPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: 908,
        height: 265,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 0,
              offset: Offset(2, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 58,
              top: 30,
              child: Text(
                'Submit for Approval',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF42604C),
                  fontSize: 48,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 113,
              top: 125,
              child: Row(
                children: [
                  Icon(
                    Icons.warning,
                    color: Color(0xFFFF0000),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Submit this Lesson Plan for review by the Program Head before publishing.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFF0000),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 606,
              top: 185,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF0000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(width: 1, color: Color(0xFFFF0000)),
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 738,
              top: 185,
              child: ElevatedButton(
                onPressed: () {
                  // Implement your continue logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(width: 1),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 57,
              top: 103,
              child: Container(
                width: 794,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 4,
                      color: Color(0xFF42604C),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
