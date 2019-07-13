import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  var text;

  NewRoute({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("new route"),
      ),
      body: WillPopScope(
          child: Center(
            child: Text(text),
          ),
          onWillPop: () {
            Navigator.of(context).pop("返回时携带的数据");
          }),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop("返回时携带的数据");
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
