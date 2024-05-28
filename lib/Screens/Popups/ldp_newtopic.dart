import 'package:flutter/material.dart';

class NewTopicPopup extends StatefulWidget {
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  NewTopicPopup({this.onConfirm, this.onCancel});

  @override
  _NewTopicPopupState createState() => _NewTopicPopupState();
}

class _NewTopicPopupState extends State<NewTopicPopup> {
  final TextEditingController _textEditingController = TextEditingController();
  String _topicTitle = '';

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

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
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _topicTitle = value;
                      });
                    },
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
                      width: 0,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        if (widget.onCancel != null) {
                          widget.onCancel!();
                        }
                        Navigator.pop(context);
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
                        if (_topicTitle.isNotEmpty) {
                          print(Text(_topicTitle)); //VALUE CHECKER
                          if (widget.onConfirm != null) {
                            widget.onConfirm!();
                          }
                          //_addNewTopic(_topicTitle); dae ko macall baga ni
                          Navigator.pop(context);
                        }
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
