import 'package:flutter/material.dart';

class ExpansionPanels extends StatefulWidget {
  ExpansionPanels({Key? key})
      : topicTitle = '',
        super(key: key);
  String topicTitle;

  @override
  State<ExpansionPanels> createState() => _ExpansionPanelsState();
}

class _ExpansionPanelsState extends State<ExpansionPanels> {
  List<Item> _data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: _buildPanel(),
        ),
      ),
    );
  }

  void public;
  _addNewTopic() {
    setState(() {
      _data.add(Item(isExpanded: false)); // Add a new item to the list
    });
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded; // Toggle the expansion state
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Container(
              width: 1211,
              height: 58,
              child: Stack(
                children: [
                  Positioned(
                    left: 59,
                    top: 0,
                    child: Text(
                      'SAMPLE MODULE',
                      style: TextStyle(
                        color: Color(0xFF436850),
                        fontSize: 25,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 57,
                    child: Container(
                      width: 1211,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 4,
                            color: Color(0xFF436850),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          body: ListTile(
            title: Text(
              'Sample Data 1',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Description of Sample Data 1'),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class Item {
  Item({
    required this.isExpanded,
  });

  bool isExpanded;
}
