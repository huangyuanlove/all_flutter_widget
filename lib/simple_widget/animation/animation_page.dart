import 'package:flutter/material.dart';
import 'tween_widget_page.dart';

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
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return TweenWidgetPage();
              }));
            },
            child: Text("补间动画(Tween)"),
          ),
        ],
      ),
    );
  }
}
