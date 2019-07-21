import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  final TextStyle txtColor = TextStyle(color: Colors.white);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ExpandedWidget"),),
      body: Column(
        children: <Widget>[
          Text('Expanded'),
          Row(children: <Widget>[
            RaisedButton(
              onPressed: () {
                print('点击红色按钮事件');
              },
              color: const Color(0xffcc0000),
              child:  Text('红色按钮',style: txtColor,),
            ),
            Expanded(
              flex: 1,//flex用来设置当前可用空间的占优比
              child:  RaisedButton(
                onPressed: () {
                  print('点击黄色按钮事件');
                },
                color: const Color(0xfff1c232),
                child:  Text('黄色按钮',style: txtColor,),
              ),
            ),
            RaisedButton(
              onPressed: () {
                print('点击粉色按钮事件');
              },
              color: const Color(0xffea9999),
              child:  Text('粉色按钮',style: txtColor,),
            ),
          ]),
          Text('Flexible'),
          Row(children: <Widget>[
            RaisedButton(
              onPressed: () {
                print('点击红色按钮事件');
              },
              color: const Color(0xffcc0000),
              child:  Text('红色按钮',style: txtColor,),
            ),
            Flexible(
              flex: 1,
              child:  RaisedButton(
                onPressed: () {
                  print('点击黄色按钮事件');
                },
                color: const Color(0xfff1c232),
                child:  Text('黄色按钮',style: txtColor,),
              ),
            ),
            RaisedButton(
              onPressed: () {
                print('点击粉色按钮事件');
              },
              color: const Color(0xffea9999),
              child:  Text('粉色按钮',style: txtColor,),
            ),
          ]),
        ],
      ),

    );
  }
}
