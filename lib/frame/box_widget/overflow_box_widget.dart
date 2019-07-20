import 'package:flutter/material.dart';

class OverflowBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OverflowBoxWidget"),
      ),
      body: Column(
        children: <Widget>[
//          OverflowBox(
//            maxWidth: 400,
//            maxHeight: 400,
//            minHeight: 100,
//            minWidth: 100,
//            child: Container(
//              width: 300,
//              height: 80,
//              color: Colors.tealAccent,
//            ),
//          ),
          SizedOverflowBox(
            size: Size(100, 100),
            child: Container(
              width: 200,
              height: 80,
              color: Colors.teal,
            ),
          )
        ],
      ),
    );
  }
}
