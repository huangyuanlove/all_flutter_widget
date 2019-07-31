import 'package:flutter/material.dart';

class AnimationPageWidget extends StatefulWidget {
  @override
  _AnimationPageWidgetState createState() => _AnimationPageWidgetState();
}

class _AnimationPageWidgetState extends State<AnimationPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("animation"),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: () {},
            child: Text("补间动画(Tween)"),
          )
        ],
      ),
    );
  }
}
