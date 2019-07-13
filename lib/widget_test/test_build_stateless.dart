import 'package:flutter/material.dart';

class TestBuildStateLess extends StatelessWidget {

  String text = "123";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试构建"),
      ),
      body:Center(
        child: buildText(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          text += text;
          print(text);
        },
        child: new Icon(Icons.add),
        tooltip: "tip tip",
      ),
    );
  }

  Widget buildText(){
    print(text);
    return Text(text);
  }

}
