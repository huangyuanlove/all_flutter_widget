import 'package:flutter/material.dart';

class BRouterWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Map value = ModalRoute
        .of(context)
        .settings
        .arguments;


    return Scaffold(
      appBar: AppBar(
        title: Text("命名路由B"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(value["title"], style: TextStyle(color: Colors.blue),),
            FlatButton(onPressed: () {
              Map arguments = {
              "shareContent": "这是分享的内容",
              "shareImageUrl": "这是分享的图片链接",
              "shareTitle": "这是分享的标题"
              };
              Navigator.of(context).pushNamed("c_router_widget",arguments: arguments);
            }, child: Text("命名路由C"))

          ],
        ),
      ),
    );
  }
}
