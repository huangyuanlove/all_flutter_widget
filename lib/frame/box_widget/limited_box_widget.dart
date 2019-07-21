import 'package:flutter/material.dart';

class LimitedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LimitedBoxWidget"),
      ),
      body: Column(
        children: <Widget>[
          LimitedBox(
            maxHeight: 100,
            maxWidth: 100,
            child: Container(
              width: 250,
              height: 250,
              color: Colors.lightGreenAccent,
            ),
          ),
          RotatedBox(
            quarterTurns: 2,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.deepOrange,
              child: Text("RotatedBox"),
            ),
          )
        ],
      ),
    );
  }
}
