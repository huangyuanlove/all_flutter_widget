import 'package:flutter/material.dart';
import 'line_char_demo.dart';
class FLChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("fl_chart 0.7.0"),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("line_chart"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return LineCharDemo1();
                  }));
                },
              ),
            ],
          ),
        ));
  }
}
