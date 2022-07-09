import 'package:flutter/material.dart';
import 'MyPageHome.dart';

class AppTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "flutter demo",
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MyPageHome(),
    );
  }
}
