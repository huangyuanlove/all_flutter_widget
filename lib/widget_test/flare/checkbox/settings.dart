import 'package:flutter_widget/widget_test/flare/checkbox/smiley_switch.dart';
import 'package:flutter/material.dart';

class CheckBoxFlare extends StatefulWidget {
  @override
  _CheckBoxFlareState createState() => _CheckBoxFlareState();
}

class _CheckBoxFlareState extends State<CheckBoxFlare> {
  final List<bool> options = [false, true, false, true, true];
  bool _snapToEnd = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: options
                  .asMap()
                  .map((i, isOn) => MapEntry(
                      i,
                      SmileySwitch(isOn, snapToEnd: _snapToEnd, onToggle: () {
                        setState(() {
                          _snapToEnd = false;
                          options[i] = !isOn;
                        });
                      })))
                  .values
                  .toList()
                  .cast<Widget>() +
              [
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.pinkAccent,
                  child: const Text('Back'),
                )
              ],
        ),
      ),
    );
  }
}
