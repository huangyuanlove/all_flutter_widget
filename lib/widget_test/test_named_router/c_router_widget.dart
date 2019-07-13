import 'package:flutter/material.dart';

class CRouterWidget extends StatelessWidget {
  String shareContent;
  String shareImageUrl;
  String shareTitle;

  CRouterWidget(
      {@required this.shareContent,
      @required this.shareImageUrl,
      @required this.shareTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("命名路由C"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              shareTitle,
              style: TextStyle(color: Colors.cyan),
            ),
            Text(
              shareImageUrl,
              style: TextStyle(color: Colors.green),
            ),
            Text(
              shareContent,
              style: TextStyle(color: Colors.deepOrange),
            ),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("d_router_widget");
                },
                child: Text("去D界面")),
            FlatButton(
                onPressed: () {
                  //用D界面替换当前界面  从SplashScreen到HomeScreen。它应该只显示一次，用户不应该再从主屏幕回到它
                  Navigator.of(context).pushReplacementNamed("d_router_widget");
                },
                child: Text("去D界面，替换C界面历史")),
          ],
        ),
      ),
    );
  }
}
