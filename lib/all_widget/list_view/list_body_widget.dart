import 'package:flutter/material.dart';

class ListBodyWidget extends StatefulWidget {
  @override
  _ListBodyWidgetState createState() => _ListBodyWidgetState();
}

class _ListBodyWidgetState extends State<ListBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListBodyWidget"),
      ),
      body:Column(children: <Widget>[
        ListBody(
          mainAxis: Axis.vertical, // 排列的主轴方向
          reverse: false, // 是否反向
          children: <Widget>[
            Container(
                color: Colors.red,
                width: 50.0,
                height: 150.0,
                child: Text('标题1', style: TextStyle(color: Color(0xffffffff)))),
            Container(
                color: Colors.yellow,
                width: 50.0,
                height: 50.0,
                child: Text('标题2', style: TextStyle(color: Color(0xffffffff)))),
            Container(
                color: Colors.green,
                width: 50.0,
                height: 50.0,
                child: Text('标题3', style: TextStyle(color: Color(0xffffffff)))),
            Container(
                color: Colors.blue,
                width: 50.0,
                height: 50.0,
                child: Text('标题4', style: TextStyle(color: Color(0xffffffff)))),
            Container(
                color: Colors.black,
                width: 50.0,
                height: 50.0,
                child: Text('标题5', style: TextStyle(color: Color(0xffffffff))))
          ],
        ),
      ],),



    );
  }
}
