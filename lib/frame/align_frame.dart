import 'package:flutter/material.dart';

class AlignFrame extends StatefulWidget {
  @override
  _AlignFrameState createState() => _AlignFrameState();
}

class _AlignFrameState extends State<AlignFrame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("align"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.cyan,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Java"),
                  Text("Python"),
                  Text("C++"),
                ],
              ),
            ),
            Container(
              color: Colors.lightGreenAccent,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Java"),
                  Text("Python"),
                  Text("C++"),
                ],
              ),
            ),
            Container(
              color: Colors.deepOrange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  Text("Java"),
                  Text("Python"),
                  Text("C++"),
                ],
              ),
            ),
            Container(
              color: Colors.amber,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                verticalDirection: VerticalDirection.up,
                children: <Widget>[
                  Text(
                    "Java",
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Text("Python"),
                  Text("C++"),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {},child: Icon(Icons.android),),
    );
  }
}
