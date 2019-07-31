import 'package:flutter/material.dart';

class TweenWidgetPage extends StatefulWidget {
  @override
  _TweenWidgetPageState createState() => _TweenWidgetPageState();
}

class _TweenWidgetPageState extends State<TweenWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TweenWidgetPage"),
      ),
      body: ListView(
        children: <Widget>[

          RaisedButton(
            onPressed: () {},
            child: Text("tween"),
          )
        ],
      ),
    );
  }
}
