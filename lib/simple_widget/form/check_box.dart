
import 'package:flutter/material.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';

class CheckBoxWidget extends StatefulWidget {
  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBoxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CheckBox"),
        ),
        body: WidgetWithCodeView(
            filePath: "lib/simple_widget/form/check_box.dart",
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.black12,
                    child: Row(
                      children: <Widget>[
                        _CheckBoxDefault(),
                        _CheckBoxDefault(),
                        _CheckBoxDefault(),
                        _CheckBoxDefault(),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blueAccent,
                    child: Column(
                      children: <Widget>[
                        _CheckBoxListTileDefault(),
                        _CheckBoxListTileDefault(),
                        _CheckBoxListTileDefault(),
                      ],
                    ),
                  ),
                  _RadioButton(),
                  _RadioListTile(),
                ],
              ),
            )));
  }
}

class _CheckBoxDefault extends StatefulWidget {
  @override
  _CheckBoxDefaultState createState() => _CheckBoxDefaultState();
}

class _CheckBoxDefaultState extends State<_CheckBoxDefault> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      onChanged: (value) {
        setState(() {
          isChecked = value ?? false;
        });
      },
      value: isChecked,
    );
  }
}

class _CheckBoxListTileDefault extends StatefulWidget {
  @override
  __CheckBoxListTileDefaultState createState() =>
      __CheckBoxListTileDefaultState();
}

class __CheckBoxListTileDefaultState extends State<_CheckBoxListTileDefault> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChecked,
      activeColor: Colors.lightGreenAccent,
      onChanged: (value) {
        setState(() {
          isChecked = value ?? false;
        });
      },
      title: Text("title"),
      subtitle: Text("subTitle"),
      secondary: Text("secondary"),
    );
  }
}

class _RadioButton extends StatefulWidget {
  @override
  __RadioButtonState createState() => __RadioButtonState();
}

class __RadioButtonState extends State<_RadioButton> {
  //当value和groupValue一致的时候则选中

  int groupValue = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.tealAccent,
        child: Row(
          children: <Widget>[
            Radio<int>(
                value: 0,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    print("value:$value");
                    groupValue = value ?? -1;
                  });
                }),
            Radio<int>(
                value: 1,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    print("value:$value");
                    groupValue = value ?? -1;
                  });
                }),
            Radio<int>(
                value: 2,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    print("value:$value");
                    groupValue = value ?? -1;
                  });
                }),
          ],
        ));
  }
}

class _RadioListTile extends StatefulWidget {
  @override
  __RadioListTileState createState() => __RadioListTileState();
}

class __RadioListTileState extends State<_RadioListTile> {
  int groupValue = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile<int>(
          value: 0,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() {
              groupValue = value ?? -1;
            });
          },
          activeColor: Colors.tealAccent,
          title: Text("title"),
          subtitle: Text("subtitle"),
        ),
        RadioListTile<int>(
          value: 1,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() {
              groupValue = value ?? -1;
            });
          },
          activeColor: Colors.tealAccent,
          title: Text("title"),
          subtitle: Text("subtitle"),
        ),
        RadioListTile<int>(
          value: 2,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() {
              groupValue = value ?? -1;
            });
          },
          activeColor: Colors.tealAccent,
          title: Text("title"),
          subtitle: Text("subtitle"),
        ),
      ],
    );
  }
}
