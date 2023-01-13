import 'package:flutter/material.dart';

class TestDeliverValueWidget extends StatelessWidget{

  TestDeliverValueWidget({Key? key, required this.value}):super(key:key );

  final String value;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(title: Text("TestDeliverValueWidget"),),
        body: Stack(
        children: <Widget>[
          Text(value),
          FlatButton(
            child: Text("返回"),
            onPressed: (){

              Navigator.of(context).pop(value + value);
            },
          ),
        ],
    ),
      );
  }


}