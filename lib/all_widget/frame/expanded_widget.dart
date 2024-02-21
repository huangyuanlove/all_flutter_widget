import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  final TextStyle txtColor = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpandedWidget"),
      ),
      body: Column(
        children: <Widget>[
          Text('Expanded'),
          Row(children: <Widget>[
            ElevatedButton(
              onPressed: () {
                print('点击红色按钮事件');
              },
              child: Text(
                '红色按钮',
                style: txtColor,
              ),
            ),
            Expanded(
              flex: 1, //flex用来设置当前可用空间的占优比
              child: ElevatedButton(
                onPressed: () {
                  print('点击黄色按钮事件');
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xfff1c232))),
                child: Text(
                  '黄色按钮',
                  style: txtColor,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('点击粉色按钮事件');
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xffea9999))),
              child: Text(
                '粉色按钮',
                style: txtColor,
              ),
            ),
          ]),
          Text('Flexible'),
          Row(children: <Widget>[
            ElevatedButton(
              onPressed: () {
                print('点击红色按钮事件');
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xffcc0000))),
              child: Text(
                '红色按钮',
                style: txtColor,
              ),
            ),
            Flexible(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  print('点击黄色按钮事件');
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xfff1c232))),
                child: Text(
                  '黄色按钮',
                  style: txtColor,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('点击粉色按钮事件');
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xffea9999))),
              child: Text(
                '粉色按钮',
                style: txtColor,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
