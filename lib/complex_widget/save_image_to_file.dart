import 'package:flutter/material.dart';

class SaveImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("保存图片测试"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            GestureDetector(
              child: Image.network(
                  "http://pic37.nipic.com/20140113/8800276_184927469000_2.png"),
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }

}
