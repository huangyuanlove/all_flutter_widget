import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget/third_part/image_test.dart';
import 'package:flutter_widget/third_part/riverpod/riverpod_widget.dart';

import 'package:flutter_widget/third_part/sticky_header/sticky_header_like_qq_list.dart';

class ThirdPartHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("常用三方"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ElevatedButton(
              child: Text("fl_chart"),
              onPressed: () {},
            ),
            Divider(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ReverpodWidget();
                }))
              },
              child: Text("riverpod"),
              style: ButtonStyle(),
            ),

            Divider(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ImageTest();
                }))
              },
              child: Text("TestImage"),
            ),
            Divider(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return StickyHeaderLikeQQList();
                }))
              },
              child: Text("StickyHeaderLikeQQList"),
            ),
            Divider(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
