import 'package:flutter/material.dart';

class DRouterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("命名路由D"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(child: Text("退出当前界面，回到A界面"),
            onPressed: (){
              Navigator.of(context).popUntil( ModalRoute.withName('a_router_widget'));
            },),
            FlatButton(child: Text("打开E界面，同时清除之前打开的界面"),
              onPressed: (){
                Navigator.of(context).pushNamedAndRemoveUntil("e_router_widget", ModalRoute.withName("a_router_widget"));
              },),

          ],
        ),
      ),
    );
  }
}
