import 'package:flutter/material.dart';
class ThirdPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("常用三方"),),
      body: Center(
        child: ListView(
          children: <Widget>[

            RaisedButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("fl_chart"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), onPressed: () {

            },

            ),
          ],
        ),
      ),

    );
  }
}
