import 'package:flutter/material.dart';

class AddNewTopic extends StatelessWidget {
  const AddNewTopic({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 451,
        height: 194,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 35,
              top: 51,
              child: Container(
                width: 380,
                height: 67,
                decoration: ShapeDecoration(
                  color: Color(0xFFE2E2E2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 18, // Adjust the font size here
                    ),
                    //maxLength: 100,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 35,
              top: 140,
              child: Container(
                width: 380,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0, // Set width to 0 to remove the border
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Spacer(), // Push buttons to the right
                    TextButton(
                      onPressed: () {
                        // Add cancel button logic
                        Navigator.pop(context); // Close the dialog
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Add add button logic
                      },
                      child: Text(
                        'Add',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 35,
              top: 22,
              child: Text(
                'Add Topic Title',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
