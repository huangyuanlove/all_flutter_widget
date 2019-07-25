import 'package:flutter/material.dart';

class SpacingWidget extends StatefulWidget {
  @override
  _SpacingWidgetState createState() => _SpacingWidgetState();
}

class _SpacingWidgetState extends State<SpacingWidget> {


  double paddingValue;

  void initState() {
    super.initState();
    paddingValue = 10.0;
  }

  _changePadding() {
    if (paddingValue == 10.0) {
      setState(() {
        paddingValue = 100.0;
      });
    } else {
      setState(() {
        paddingValue = 10.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SpacingWidget"),),
      body: Column(
        children: <Widget>[
          AnimatedPadding(
            padding: EdgeInsets.symmetric(
                horizontal: paddingValue, vertical: paddingValue),
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
            child: Container(
              height: 200.0,
              color: Colors.blueAccent,
            ),
          ),
          RaisedButton(
            onPressed: _changePadding,
            child: Text('change padding'),
          )
        ],
      ),
    );
  }
}
