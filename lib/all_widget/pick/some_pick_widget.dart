import 'package:flutter/material.dart';

class SomePickWidget extends StatefulWidget {
  @override
  _SomePickWidgetState createState() => _SomePickWidgetState();
}

class _SomePickWidgetState extends State<SomePickWidget> {
  String dayPickerValue = "dayPickerValue";
  String timePickerValue = "timePickerValue";
  DateTime _date = DateTime.now();

  TimeOfDay _time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SomePickWidget"),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: () async {
              final DateTime picked = await showDatePicker(
                  context: context,
                  initialDate: _date,
                  firstDate: DateTime(2015, 8),
                  lastDate: DateTime(2101));

              if (picked != null && picked != _date) {
                setState(() {
                  dayPickerValue = picked.toString();
                });
              }
            },
            child: Text(dayPickerValue),
          ),
          RaisedButton(
            onPressed: () async {
              final TimeOfDay picked =
                  await showTimePicker(context: context, initialTime: _time);

              if (picked != null && picked != _time) {
                setState(() {
                  timePickerValue = picked.toString();
                });
              }
            },
            child: Text(timePickerValue),
          ),
        ],
      ),
    );
  }
}
