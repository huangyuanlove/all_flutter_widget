import 'package:flutter/material.dart';

class SomeMenuWidget extends StatefulWidget {
  @override
  _SomeMenuWidgetState createState() => _SomeMenuWidgetState();
}

class _SomeMenuWidgetState extends State<SomeMenuWidget> {
  GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  List<String> _checkedValues =[];
  final String _checkedValue1 = 'One';
  final String _checkedValue2 = 'Two';
  final String _checkedValue3 = 'Free';
  final String _checkedValue4 = 'Four';

  String dropDown1Value = "Free";
  String dropdown2Value ="Default";
  String dropdown3Value = 'Four';

  final String _simpleValue1 = 'Menu item value one';
  final String _simpleValue2 = 'Menu item value two';
  final String _simpleValue3 = 'Menu item value three';
  String _simpleValue="";

  void showPopupMenuSelection(String value) {
    if (<String>[_simpleValue1, _simpleValue2, _simpleValue3].contains(value))
      _simpleValue = value;
    _scaffoldKey.currentState
        ?.showSnackBar(SnackBar(content: Text('You selected: $value')));
  }

  @override
  void initState() {
    _checkedValues = <String>[_checkedValue3];
    _simpleValue = _simpleValue2;
    super.initState();
    checkParams();
  }

  bool isChecked(String value) => _checkedValues.contains(value);

  void showCheckedMenuSelections(String value) {
    if (_checkedValues.contains(value)) {
      _checkedValues.remove(value);
    } else {
      _checkedValues.add(value);
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Checked $_checkedValues')));
  }

  void checkParams() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("menu"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text(
              'CheckedPopupMenuItem Demo',
              style:
                  TextStyle(color: Colors.white, backgroundColor: Colors.red),
            ),
            trailing: PopupMenuButton<String>(
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem<String>>[
                  CheckedPopupMenuItem<String>(
                      value: _checkedValue1,
                      checked: isChecked(_checkedValue1),
                      child: Text(_checkedValue1)),
                  CheckedPopupMenuItem<String>(
                      value: _checkedValue2,
                      enabled: false,
                      checked: isChecked(_checkedValue2),
                      child: Text(_checkedValue2)),
                  CheckedPopupMenuItem<String>(
                      value: _checkedValue3,
                      checked: isChecked(_checkedValue3),
                      child: Text(_checkedValue3)),
                  CheckedPopupMenuItem<String>(
                      value: _checkedValue4,
                      checked: isChecked(_checkedValue4),
                      child: Text(_checkedValue4))
                ];
              },
              onSelected: showCheckedMenuSelections,
            ),
          ),
          ListTile(
            title: const Text(
              "DropdownMenuItem",
              style:
                  TextStyle(color: Colors.white, backgroundColor: Colors.red),
            ),
            trailing: DropdownButton<String>(
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged:(String? value){
                  setState(() {
                    dropDown1Value = value??"";
                  });
              } ,

              value: dropDown1Value,
            ),
          ),
          ListTile(
            title: const Text('Dropdown with a hint:'),
            trailing: DropdownButton<String>(
              value: dropdown2Value,
              hint: const Text('Choose'),
              onChanged: (String? newValue) {
                setState(() {
                  dropdown2Value = newValue??"";
                });
              },
              items: <String>['One', 'Two', 'Free', 'Four',"Default"]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: const Text('Scrollable dropdown:'),
            trailing: DropdownButton<String>(
              value: dropdown3Value,
              onChanged: (String? newValue) {
                setState(() {
                  dropdown3Value = newValue??"";
                });
              },
              items: <String>[
                'One',
                'Two',
                'Free',
                'Four',
                'Can',
                'I',
                'Have',
                'A',
                'Little',
                'Bit',
                'More',
                'Five',
                'Six',
                'Seven',
                'Eight',
                'Nine',
                'Ten'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: const Text(
              "PopupMenuButton",
              style:
                  TextStyle(color: Colors.white, backgroundColor: Colors.red),
            ),
            trailing: PopupMenuButton<String>(
                onSelected: showPopupMenuSelection,
                itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                      PopupMenuItem<String>(
                          value: _simpleValue1,
                          child: const Text('Context menu item one')),
                      const PopupMenuItem<String>(
                          enabled: false, child: Text('A disabled menu item')),
                      PopupMenuItem<String>(
                          value: _simpleValue3,
                          child: const Text('Context menu item three')),
                    ]),
          ),
          ListTile(
            title: const Text(
              'An item with a sectioned menu',
              style:
                  TextStyle(color: Colors.white, backgroundColor: Colors.red),
            ),
            trailing: PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              onSelected: showPopupMenuSelection,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                        value: 'Preview',
                        child: ListTile(
                            leading: Icon(Icons.visibility),
                            title: Text('Preview'))),
                    const PopupMenuItem<String>(
                        value: 'Share',
                        child: ListTile(
                            leading: Icon(Icons.person_add),
                            title: Text('Share'))),
                    const PopupMenuItem<String>(
                        value: 'Get Link',
                        child: ListTile(
                            leading: Icon(Icons.link),
                            title: Text('Get link'))),
                    const PopupMenuDivider(),
                    const PopupMenuItem<String>(
                        value: 'Remove',
                        child: ListTile(
                            leading: Icon(Icons.delete), title: Text('Remove')))
                  ],
            ),
          ),
        ],
      ),
    );
  }
}
